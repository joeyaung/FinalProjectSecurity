let productPageVM = new Vue({
  el: "#app",
  data: {
    products: [],
    cartItem: [],
    sortMethod: "",
    displayTags: [],
    queryString: "",
  },
  methods: {
    dollorFormated(price) {
      var formatter = new Intl.NumberFormat("en-US", {
        style: "currency",
        currency: "TWD",
        minimumFractionDigits: 0,
      });
      return formatter.format(price);
    },
    selectTag(index) {
      console.log("selecting tag");
      let tag = this.popularTags[index];

      if (tag.selected) {
        let indexOfDisplay = this.displayTags.indexOf(tag.tagName);
        console.log(indexOfDisplay);
        this.displayTags.splice(indexOfDisplay, 1);
      } else {
        this.displayTags.push(tag.tagName);
      }

      this.popularTags[index].selected = !this.popularTags[index].selected;
      console.log("end selecting tag");
    },
    addToCart(index, event) {
      event.preventDefault();
      let selectProduct = this.products[index];
      let self = this;
      $.ajax({
        url: `/FinalProject/api/v1/cart/add_to_cart/${selectProduct.id}`,
        type: "POST",
        dataType: "text",
        success: function (res) {
          if (res == "unauthorized") {
            window.location = "/FinalProject/login";
            return;
          }
          if (res == "ok") {
            self.fetchMemberCartItem();
          } else {
            console.log(res);
          }
        },
      });
    },
    fetchAllProductsData() {
      let self = this;
      $.ajax({
        url: "/FinalProject/api/v1/product",
        type: "GET",
        dataType: "json",
        success: function (res) {
          for (let i = 0; i < res.length; i++) {
            var newProduct = {};
            newProduct.id = res[i].id;
            newProduct.name = res[i].name;
            newProduct.isOnSale = res[i].onSale;
            newProduct.curPrice = res[i].curPrice;
            newProduct.originPrice = res[i].originalPrice;
            newProduct.imgPath = res[i].imgPath;
            newProduct.tags = res[i].tags;
            self.products.push(newProduct);
          }
        },
        error: function () {
          console.log("Fetch products data failed.");
        },
      });
    },
    fetchMemberCartItem() {
      let self = this;
      $.ajax({
        url: "/FinalProject/api/v1/cart/member",
        type: "GET",
        dataType: "json",
        success: function (res) {
          self.cartItem = res;
        },
      });
    },
    mergeLowToHigh(left, right) {
      var result = [];
      while (left.length > 0 && right.length > 0) {
        if (left[0].curPrice < right[0].curPrice) {
          result.push(left.shift());
        } else {
          result.push(right.shift());
        }
      }
      return result.concat(left, right);
    },
    mergeHighToLow(left, right) {
      var result = [];
      while (left.length > 0 && right.length > 0) {
        if (left[0].curPrice > right[0].curPrice) {
          result.push(left.shift());
        } else {
          result.push(right.shift());
        }
      }
      return result.concat(left, right);
    },
    mergeSort(arr, type) {
      if (arr.length <= 1) {
        return arr;
      }
      var middle = Math.floor(arr.length / 2);
      var left = arr.slice(0, middle);
      var right = arr.slice(middle);
      if (type == "greater") {
        return this.mergeLowToHigh(
          this.mergeSort(left, type),
          this.mergeSort(right, type)
        );
      } else {
        return this.mergeHighToLow(
          this.mergeSort(left, type),
          this.mergeSort(right, type)
        );
      }
    },
    queryMethod(arr, query) {
      let foudedData = [];
      for (let i = 0; i < arr.length; i++) {
        if (arr[i].name.includes(query)) {
          foudedData.push(arr[i]);
        }
      }
      return foudedData;
    },
    findTagData(arr, tags) {
      let foudedData = [];
      for (let i = 0; i < arr.length; i++) {
        for (let j = 0; j < tags.length; j++) {
          if (arr[i].tags.includes(tags[j])) {
            foudedData.push(arr[i]);
            break;
          }
        }
      }
      return foudedData;
    },
  },
  computed: {
    cart_item_total_quantity() {
      let total = 0;
      for (let i = 0; i < this.cartItem.length; i++) {
        total += this.cartItem[i].quantityInCart;
      }
      return total;
    },
    displayCartItem() {
      let query = this.queryString;
      let sortMethod = this.sortMethod;

      let displayTags = this.displayTags;
      let rowData = this.products;
      let result = [];

      // 先排序

      let sortedData = this.mergeSort(rowData, sortMethod);
      result = sortedData;

      // 關鍵字
      if (query != "") {
        let queryedData = this.queryMethod(sortedData, query);
        result = queryedData;
      }

      // 標籤
      if (displayTags.length > 0) {
        let tagsData = this.findTagData(result, displayTags);
        result = tagsData;
      }

      return result;
    },
    popularTags() {
      let rowData = this.products;
      let allTags = [];
      for (let i = 0; i < rowData.length; i++) {
        for (let j = 0; j < rowData[i].tags.length; j++) {
          allTags.push(rowData[i].tags[j]);
        }
      }
      let uniqueTags = [...new Set(allTags)];

      let index = [];
      for (let k = 0; k < uniqueTags.length; k++) {
        let count = 0;
        for (let i = 0; i < allTags.length; i++) {
          if (uniqueTags[k] == allTags[i]) {
            count += 1;
          }
        }
        index.push(count);
      }
      let resultMap = [];
      for (let i = 0; i < uniqueTags.length; i++) {
        let curData = {
          tagName: uniqueTags[i],
          count: index[i],
          selected: false,
        };
        resultMap.push(curData);
      }

      resultMap.sort(function (a, b) {
        var countA = a.count;
        var countB = b.count;
        if (countA < countB) {
          return 1;
        }
        if (countA > countB) {
          return -1;
        }
        return 0;
      });

      return resultMap.slice(0, 5);
    },
  },
  mounted: function () {
    this.fetchAllProductsData();
    this.fetchMemberCartItem();
  },
});

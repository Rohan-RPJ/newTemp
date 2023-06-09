class InvoiceJsonProcessor {
  #emptyInvoiceJson;

  constructor(invoiceNo) {
    this.#emptyInvoiceJson = {
      id: "5df3180a09ea16dc4b95f910",
      invoice_no: invoiceNo,
      balance: "$2,283.74",
      billFrom: {
        company: "VAISHALI SALES & SERVICES",
        email: "prakash4p654@gmail.com",
        mobileNo: "9834203564",
        address:
          "Shop no. 10, Shivgiri Apartment, Viva Girivihar Complex, Manvel Pada Road, Virar(E), Palghar-401305",
        panNo: "ACLPJ2806J",
        gstRegstrtnNo: "27ACLPJ2806J2ZH",
      },
      billTo: {
        company: "",
        email: "",
        mobileNo: "",
        address: "",
        panNo: "",
        gstRegstrtnNo: "",
      },
      trans_date: new Date().toLocaleDateString(),
      due_date: "2019-10-12",
      items: [
        {
          desc: "",
          qty: 0,
          rate: 0,
          gstPercent: 0,
        },
      ],
      bankDetails: {
        upiQrImg: process.env.IMAGE_BASE_URL + "vss-upiQr.jpeg",
      },
      eSignUrl: process.env.IMAGE_BASE_URL + "eSignUrl.jpeg",
    };
    this.invoiceJson = { ...this.#emptyInvoiceJson };
  }

  processInvoiceBill(itemsDtls) {
    let totalInvoiceAmt = 0;
    let totalGstAmt = 0;

    this.invoiceJson.items = itemsDtls.map((item) => {
      let prodNetAmt = item.rate * item.qty;
      let prodGstAmt = (prodNetAmt * item.gstPercent) / 100;
      let prodTotAmt = prodNetAmt + prodGstAmt;

      item.prodNetAmt = prodNetAmt;
      item.prodGstAmt = prodGstAmt;
      item.prodTotAmt = prodTotAmt;

      totalGstAmt += prodGstAmt;
      totalInvoiceAmt += prodTotAmt;

      return item;
    });

    this.invoiceJson.totalGstAmt = totalGstAmt;
    this.invoiceJson.totalAmt = totalInvoiceAmt;
  }

  processCustomerDtls(customerDtls) {
    this.invoiceJson.billTo = { ...customerDtls };
  }

  processESignature(eSignUrl) {
    this.invoiceJson.eSignUrl = eSignUrl;
  }

  getUpdatedItems() {
    return this.invoiceJson.items;
  }

  getUpdatedTotalGstAmt() {
    return this.invoiceJson.totalGstAmt;
  }

  getUpdatedTotalAmt() {
    return this.invoiceJson.totalAmt;
  }

  getUpdatedInvoiceJson() {
    return this.invoiceJson;
  }

  getEmptyInvoiceJson() {
    return this.#emptyInvoiceJson;
  }

  getEmptyProductItems() {
    return this.#emptyInvoiceJson.items;
  }

  getEmptyCustomerDetails() {
    return this.#emptyInvoiceJson.billTo;
  }
}

export default InvoiceJsonProcessor;

window.addEventListener('load', function(){

  const itemPrice = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  itemPrice.addEventListener('change', function(){
    let price = parseInt(itemPrice.value)
    TaxPrice = price * 0.1
    buyProfit = price - TaxPrice
    addTaxPrice.innerHTML = TaxPrice
    profit.innerHTML = buyProfit
  })
});

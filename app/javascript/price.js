window.addEventListener('DOMContentLoaded', () => {
  const path = location.pathname;
  const editRegex = /^\/items\/\d+\/edit$/
  const updateRegex = /^\/items\/\d+$/

  if(path === "/items/new" || path === "/items" || editRegex.test(path) || updateRegex.test(path)) {
    const price = document.getElementById('item-price');
    const salesCommission = document.getElementById('add-tax-price');
    const commissionFeeRate = 10; //販売手数料10%
    const profit = document.getElementById('profit');
  
    price.addEventListener('input', function() {
      salesCommission.textContent = Math.floor(this.value / commissionFeeRate).toLocaleString();
      profit.textContent = Math.floor(this.value * 0.9).toLocaleString(); //利益90％
    })
  }
})
window.addEventListener('DOMContentLoaded', () => {
  const path = location.pathname
  if(path === "/items/new" || path === "/items") {
    const price = document.getElementById('item-price');
    const salesCommission = document.getElementById('add-tax-price');
    const commissionFeeRate = 10;
    const profit = document.getElementById('profit');
  
    price.addEventListener('input', function() {
      salesCommission.textContent = Math.floor(this.value / commissionFeeRate);
      profit.textContent = Math.floor(this.value - parseInt(salesCommission.textContent, 10));
    })
  }
})
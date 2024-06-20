const payment = () => {
  const priceInput = document.getElementById('item-price');

  if (priceInput) {
    priceInput.addEventListener('input', () => {
      let price = priceInput.value.trim();
      let fee, profit;

      if (price === '') {
        fee = 0;
        profit = 0;
      } else {
        if (!/^\d*\.?\d*$/.test(price)) {
          fee = 'NaN';
          profit = 'NaN';
        } else {
          price = parseFloat(price);
          fee = calculateFee(price);
          profit = calculateProfit(price, fee);
        }
      }

      const feeDisplay = document.getElementById('add-tax-price');
      const profitDisplay = document.getElementById('profit');

      feeDisplay.innerHTML = `${fee === 'NaN' ? 'NaN' : `${fee}`}`;
      profitDisplay.innerHTML = `${profit === 'NaN' ? 'NaN' : `${profit}`}`;
    });
  }
};

function calculateFee(price) {
  return Math.floor(price * 0.1);
}

function calculateProfit(price, fee) {
  return Math.floor(price - fee);
}

window.addEventListener("turbo:load", payment);
window.addEventListener("turbo:render", payment);
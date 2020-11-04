function price(){
  const price_input = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  price_input.addEventListener('keyup', ()=>{
    tax.innerHTML = Math.round(price_input.value * 0.1 );
    profit.innerHTML = Math.round(price_input.value * 0.9 )
  });
};

window.addEventListener('load', price);
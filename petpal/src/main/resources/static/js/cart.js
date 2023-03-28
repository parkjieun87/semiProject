function updatePrice(productId) {
    var quantity = document.getElementsByName('quantity')[productId-1].value;
    var price = parseInt(document.getElementsByClassName('price')[productId-1].innerHTML.replace(',', ''));
    var total = quantity * price;
    document.getElementsByClassName('total')[productId-1].innerHTML = total.toLocaleString();
}

function addToCart(productId) {
    var quantity = document.getElementsByName('quantity')[productId-1].value;
    var price = parseInt(document.getElementsByClassName('price')[productId-1].innerHTML.replace(',', ''));
    var total = quantity * price;
    localStorage.setItem(productId, quantity);
    alert('장바구니에 추가되었습니다. 총 가격: ' + total.toLocaleString() + '원');
    updatePrice(productId);
}

function loadCart() {
    var cart = {};
    for (var i = 0; i < localStorage.length; i++) {
        var key = localStorage.key(i);
        cart[key] = localStorage.getItem(key);
    }
    return cart;
}

function updateCart(productId, quantity) {
    if (quantity == 0) {
        localStorage.removeItem(productId);
    } else {
        localStorage.setItem(productId, quantity);
    }
}

function checkout() {
    // 주문 정보를 수집하고, 데이터베이스에 저장하는 코드
    alert('주문이 완료되었습니다.');
    localStorage.clear();
    window.location.href = 'index.html';
}

$(function () {
   function numbers() {
        $.get('/bbf/cart_count/',function (response) {
            console.log(response)
                $("#spoNum").text(response.number)
        })
    }
})


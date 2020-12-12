// 販売価格を入力し、販売手数料と販売利益を計算する関数宣言
$(function (){
  
  $('#product_price').on('input',function(){
    // 販売価格の入力欄に入力すると反応
    $(this).each(()=>{
      let sales =$(this).val();
      //販売価格変数salesに入力された値をfeeへ代入(販売手数料)
      let fee=Math.ceil(sales * 0.1);
      let profit=Math.floor(sales * 0.9);
      if (sales<300) {
        $('.Products__form__fees__rate').html('➖') && $('.Products__form__profits__amount').html('➖');;
      } else{
        $('.Products__form__fees__rate').html(fee) && $('.Products__form__profits__amount').html(profit);
      }
    });
  });
})

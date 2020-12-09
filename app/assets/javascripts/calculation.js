// 販売価格を入力し、、販売手数料と販売利益を計算する関数宣言
$(function(){
  
  $('#product_price').on('input',function(){
    // 販売価格の入力欄に入力すると反応
    console.log('this');  
    let sales =$(this).val();
    //販売価格変数salesに入力された値をfeeへ代入(販売手数料)
    
    let fee=Math.ceil(sales * 0.1);
    //販売価格変数salesに入力された値をprofie(販売利益)へ代入
    let profit=Math.floor(sales * 0.9);
    //販売手数料表示
    $('.Products__form__fees__rate').html(fee);
    //販売利益表示
    $('.Products__form__profits__amount').html(profit);
  });
});

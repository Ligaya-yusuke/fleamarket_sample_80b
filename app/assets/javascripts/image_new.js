$(document).on('click', function(){
  $(function(){
    //プレビューのhtmlを定義
    function buildHTML(count) {
      let html = `<div class="preview-box" id="preview-box__${count}">
                    <div class="upper-box">
                      <img src="" alt="preview">
                    </div>
                    <div class="lower-box">
                      <div class="update-box">
                        <label class="edit_btn">編集</label>
                      </div>
                      <div class="delete-box" id="delete_btn_${count}">
                        <span>削除</span>
                      </div>
                    </div>
                  </div>`;
      return html;
    }

    // ラベルのwidth操作
    function setLabel() {
      //プレビューボックスのwidthを取得し、maxから引くことでラベルのwidthを決定
      let prevContent = $('.label-content').prev();
      labelWidth = (600 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      $('.label-content').css('width', labelWidth);
    }

    $('.label-box').on('click', function() {
    // プレビューの追加
      setLabel();
      //hidden-fieldのidの数値のみ取得
      let id = $('input'[type="file"]).attr('id').parseintreplace(/[^0-9]/g, '');
      console.log()
      //labelボックスのidとforを更新
      $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
      //選択したfileのオブジェクトを取得
      let file = $('input'[type="file"]).files[0];
      let reader = new FileReader();
      //readAsDataURLで指定したFileオブジェクトを読み込む
      reader.readAsDataURL(file);
      //読み込み時に発火するイベント
      reader.onload = function() {
        let image = this.result;
        //プレビューが元々なかった場合はhtmlを追加
        if ($(`#preview-box__${id}`).length == 0) {
          let count = $('.preview-box').length;
          let html = buildHTML(id);
          //ラベルの直前のプレビュー群にプレビューを追加
          let prevContent = $('.label-content').prev();
          $(prevContent).append(html);
        }
        //イメージを追加
        $(`#preview-box__${id} img`).attr('src', `${image}`);
        let count = $('.preview-box').length;
        //プレビューが5個あったらラベルを隠す 
        if (count == 5) { 
          $('.label-content').hide();
        }

        //ラベルのwidth操作
        setLabel();
        //ラベルのidとforの値を変更
        if(count < 5){
          //プレビューの数でラベルのオプションを更新する
          $('.label-box').attr({id: `label-box--${count}`,for: `item_images_attributes_${count}_image`});
        }
      }
    });

    // 画像の削除
    $(document).on('click', '.delete-box', function() {
      let count_delete = $('.preview-box').length;
      setLabel(count);
      //item_images_attributes_${id}_image から${id}に入った数字のみを抽出
      let id = $(this).attr('id').replace(/[^0-9]/g, '');
      //取得したidに該当するプレビューを削除
      $(`#preview-box__${id}`).remove();
      console.log("new")
      //フォームの中身を削除 
      $(`#item_images_attributes_${id}_image`).val("");

      //削除時のラベル操作
      let count = $('.preview-box').length;
      //5個めが消されたらラベルを表示
      if (count == 4) {
        $('.label-content').show();
      }
      setLabel(count);

      if(id < 5){
        //削除された際に、空っぽになったfile_fieldをもう一度入力可能にする
        $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
      }
    });
  });
})


// $(function(){
//   //DataTransferオブジェクトで、データを格納する箱を作る
//   var dataBox = new DataTransfer();
//   //querySelectorでfile_fieldを取得
//   var file_field = document.querySelector('input[type=file]')
//   //fileが選択された時に発火するイベント
//   $('#img-file').change(function(){
//     //選択したfileのオブジェクトをpropで取得
//     var files = $('input[type="file"]').prop('files')[0];
//     $.each(this.files, function(i, file){
//       //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
//       var fileReader = new FileReader();

//       //DataTransferオブジェクトに対して、fileを追加
//       dataBox.items.add(file)
//       //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に代入
//       file_field.files = dataBox.files

//       var num = $('.item-image').length + 1 + i
//       fileReader.readAsDataURL(file);
//        //画像が5枚になったら超えたらドロップボックスを削除する
//       if (num == 5){
//         $('#image-box__container').css('display', 'none')   
//       }
//       //読み込みが完了すると、srcにfileのURLを格納
//       fileReader.onloadend = function() {
//         var src = fileReader.result
//         var html= `<div class='item-image' data-image="${file.name}">
//                     <div class=' item-image__content'>
//                       <div class='item-image__content--icon'>
//                         <img src=${src} width="110" height="79" >
//                       </div>
//                     </div>
//                     <div class='item-image__operetion'>
//                       <div class='item-image__operetion--delete'>削除</div>
//                     </div>
//                   </div>`
//         //image_box__container要素の前にhtmlを差し込む
//         $('#image-box__container').before(html);
//       };
//       //image-box__containerのクラスを変更し、CSSでドロップボックスの大きさを変えてやる。
//       $('#image-box__container').attr('class', `item-num-${num}`)
//     });
//   });

//  //削除ボタンをクリックすると発火するイベント
// $(document).on("click", '.item-image__operetion--delete', function(){
//   //削除を押されたプレビュー要素を取得
//   var target_image = $(this).parent().parent()
//   //削除を押されたプレビューimageのfile名を取得
//   var target_name = $(target_image).data('image')
//   //プレビューがひとつだけの場合、file_fieldをクリア
//   if(file_field.files.length==1){
//     //inputタグに入ったファイルを削除
//     $('input[type=file]').val(null)
//     dataBox.clearData();
//     console.log(dataBox)
//   }else{
//     //プレビューが複数の場合
//     $.each(file_field.files, function(i,input){
//       //削除を押された要素と一致した時、index番号に基づいてdataBoxに格納された要素を削除する
//       if(input.name==target_name){
//         dataBox.items.remove(i) 
//       }
//     })
//     //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に再度代入
//     file_field.files = dataBox.files
//   }
//   //プレビューを削除
//   target_image.remove()
//   //image-box__containerクラスをもつdivタグのクラスを削除のたびに変更
//   var num = $('.item-image').length
//   $('#image-box__container').show()
//   $('#image-box__container').attr('class', `item-num-${num}`)
// })
// })
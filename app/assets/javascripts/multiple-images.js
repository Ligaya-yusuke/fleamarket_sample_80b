$(document).on('click', ()=> {
  // 画像用インプットを生成する関数
  const buildFileField = (num)=> {
    const html =`<div class="Products__form__images__box__previews__group" data-index="${num}">
                  <input class="Products__form__images__box__previews__group__jsFile" type="file" name="product[images_attributes][${num}][src]" id="product_images_attributes_${num}_src" kl_vkbd_parsed="true">
                  <div class="Products__form__images__box__previews__group__jsRemove">削除</div>
                </div>`;
    return html;
  }
    // プレビュー用のimgタグ生成
    const buildImg = (index, url)=> {
      const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
      return html;
    }
    // file_fieldのnameに動的なindexをつけるための配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.Products__form__images__box__previews__group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('#Image-box').on('change', '.Products__form__images__box__previews__group__jsFile', function(e){
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgタグがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('#Previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#Image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
  });

  $('#Image-box').on('click', '.Products__form__images__box__previews__group__jsRemove', function() {
    const targetIndex = $(this).parent().data('index');
    // 該当indexをふられているチェックボックスを取得
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
      // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    // 画面入力欄が0個にならないように設定
    if ($('.Products__form__images__box__previews__group__jsFile').length == 0) $('#Image-box').append(buildFileField(fileIndex[0]));
  });
});
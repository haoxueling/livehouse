KindEditor.ready(function(K){
   window.editor = K.create('#id_content', {
       width: '600px',
       height: '500px',
       items: [
                'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'cut', 'copy', 'paste',
                'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen',
                'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
                'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|',
                'table', 'hr', 'emoticons', 'pagebreak',
                'anchor', 'link', 'unlink', '|', 'about'
        ]
   });
});

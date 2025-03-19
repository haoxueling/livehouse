/**
 * File upload js
 */

/**
 * Upload a picture
 */
function uploadImage(url,newFileNameId,csrf){
	
	var $list = $("#thelist_"+newFileNameId);
    var $btn = $("#ctlBtn_"+newFileNameId);
    var pickerId = "picker_"+newFileNameId;
    //Thumbnail height and width (in pixels), when the width and height is 0~1, it is calculated according to the percentage, you can see the api documentation.
    var thumbnailWidth = 100;  
    var thumbnailHeight = 100;
	
	//Recall image
	var fileName = $("#"+newFileNameId).val();
	var fileUrl = $("#"+newFileNameId).attr("data-url");
	if(fileUrl!=null && fileUrl!=""){
		$list.html('<div id="defaultUrl" class="file-item">'+
			'<img src="'+fileUrl+'" '+
			'style="width:'+thumbnailWidth+'px;height:'+thumbnailHeight+'px"/>'+
			'<div class="info">'+fileName+'</div></div>');
	}
	
	var uploader = WebUploader.create({

	    swf: '/static/webuploader-0.1.5/Uploader.swf',

	    server: url,

	    pick: {
            id: "#"+pickerId,
            multiple: false//Can only select one file to upload
        },
	    resize: false,// No image compression, by default, if it is jpeg, the file will be compressed before uploading!
	    accept: {// Allow selection of image files only.
	        title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png',
            mimeTypes: 'image/jpg,image/jpeg,image/png'//Modify this line to speed up the opening of the upload file box
	    },
	    // Whether to upload the file automatically after selecting it.
	    auto: false,
	    fileNumLimit: 1,
		formData: {
            //type: 'image_name',
            csrfmiddlewaretoken: csrf
        },
	});
	

	uploader.on( 'fileQueued', function( file ) {
		$list.empty();
		var $li = $('<div id="' + file.id + '" class="file-item ">' +  
	                   '<img>' + 
	                   '<div class="info">' + file.name + '</div>' +  
	                '</div>');
	    var $img = $li.find('img');
        $list.append( $li );// $list is a container jQuery instance.

        uploader.makeThumb( file, function( error, src ) {   //webuploader
        	if ( error ) {  
        		$img.replaceWith('<span>No preview</span>');
        		return;  
        	}  
        	$img.attr( 'src', src );
        }, thumbnailWidth, thumbnailHeight ); 
	});
	
	uploader.on('beforeFileQueued',function(file){
	    uploader.reset();
	});
	
	// Create a progress bar to display in real time during file uploads.
	uploader.on( 'uploadProgress', function( file, percentage ) {
	    var $li = $( '#'+file.id ),
	        $percent = $li.find('.progress span');
	});

	// The file was uploaded successfully, added a successful class to the item, and marked the upload as successful with a style.
	uploader.on( 'uploadSuccess', function( file,response) {
	    $('#'+file.id ).addClass('upload-state-done');
	    layer.msg("Image uploaded successfully！");
	    console.info(response.newFileName);
	    $("#"+newFileNameId).val(response.newFileName);
	});

	// The file upload failed, showing an upload error.
	uploader.on('uploadError', function( file ) {
	    var $li = $( '#'+file.id ),
	        $error = $li.find('div.error');
	    // Avoid duplicate creation
	    if ( !$error.length ) {
	        $error = $('<div class="error"></div>').appendTo( $li );
	    }
	    $error.text('Upload Failed');
	});

	// When you're done uploading, success or failure, delete the progress bar first.
	uploader.on('uploadComplete', function( file ) {
	    $( '#'+file.id ).find('.progress').remove();
	});
	
	$btn.on('click', function(){
		if(($list.text()==null || $list.text()=="") 
				|| $list.find("#defaultUrl").length>0){
			layer.msg("Please select the image first！");
			return false;
		}
        console.log("Uploading begins...");
        uploader.upload();
        console.log("End of uploading...");
      });
	
}	


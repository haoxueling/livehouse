//public AJAX submit data
function common_ajax(url,data){
	var tempUrl = url;
	var options = {
			url: url,
			type: 'post',
            dataType: 'json',
            data:data,
            success: function (data) {
            	if(data.success>0){
            		layer.msg("The operation was successful！");
              		if(data.url!=null && data.url!=""){
              			if(data.url=="reload"){
              				setTimeout(function () {window.location.reload(); }, globalTimeout); 
              			}else{
              				setTimeout(function () {location.href=basePath+data.url; }, globalTimeout);
              			}
              		}
              	}else{
              		layer.msg("failure of operation！");
              	}
            },
            error:function(data){
            	errorFunction(data);
            }
     };
     $.ajax(options);
}

//public AJAX request, self-processing return results
function common_ajax_self_result(url,data,callback){
	var tempUrl = url;
	var options = {
			url: url,
			type: 'post',
			dataType: 'json',
			data:data,
			success: function (data) {
				if(callback!=null){
					callback(data);
				}
			},
	        error:function(data){
	        	errorFunction(data);
	        }
	};
	$.ajax(options);
}


function common_ajax_other(url,data){
	var tempUrl = url;
	var options = {
			url: url,
			type: 'post',
			dataType: 'json',
			data:data,
			success: function (data) {
				if(data.success>0){
					if(data.message!=null && data.message!=""){
						layer.msg(data.message);
					}else{
						layer.msg("The operation was successful！");
					}
					if(data.url!=null && data.url!=""){
						if(data.url=="reload"){
              				setTimeout(function () {window.location.reload(); }, globalTimeout);  
              			}else{
              				setTimeout(function () {location.href=data.url; }, globalTimeout);
              			}
					}
				}else{
					if(data.message!=null && data.message!=""){
						layer.msg(data.message);
					}else{
						layer.msg("failure of operation！");
					}
				}
			},
		    error:function(data){
		    	errorFunction(data);
		    }
	};
	$.ajax(options);
}


function common_ajax_callback_other(url,data,callbackSuccess,callbackError){
	var tempUrl = url;
	var options = {
			url: url,
			type: 'post',
			dataType: 'json',
			data:data,
			success: function (data) {
				if(data.success>0){
					if(data.message!=null && data.message!=""){
						layer.msg(data.message);
					}else{
						layer.msg("The operation was successful！");
					}
					if(data.url!=null && data.url!=""){
						if(data.url=="reload"){
              				setTimeout(function () {window.location.reload(); }, globalTimeout);             
              			}else{
              				setTimeout(function () {location.href=data.url; }, globalTimeout);
              			}
					}
					if(callbackSuccess!=null){
						callbackSuccess(data);
					}
				}else{
					if(data.message!=null && data.message!=""){
						layer.msg(data.message);
					}else{
						layer.msg("failure of operation！");
					}
					if(callbackError!=null){
						callbackError(data);
					}
				}
			},
			error:function(data){
				errorFunction(data);
			}
	};
	$.ajax(options);
}

// If the operation fails, handle it here
function errorFunction(data){
	console.info("ajaxError...");
	layer.msg("The operation failed! Please log in again!");
    if (window != top){
    	setTimeout(function () {
    		top.location.href = "/login";
    	}, globalTimeout);
    }else{
    	setTimeout(function () {
    		top.location.href = "/login";
    	}, globalTimeout);
    }
}

	
// 判断是否登录，如果没有登录就显示登录按钮，如果登录了就显示用户图标，点击用户图标跳转用户设置页面。
function  getSession(uid){
    var uid=uid;
    if(typeof(uid)!="undefined"){
        var htmlStr="";
        htmlStr+="<div onclick=\"window.open ('account/settings','_self')\">";
        htmlStr+="<img src=\"assets/images/users/"+uid+".jpg\" alt class=\"index-user-i\">";
        htmlStr+="</div>";
        $("#login-btn-div").html(htmlStr);
    }
    else{
        var htmlStr="";
        htmlStr+="<button class=\"login-btn\" onclick=\"window.open('login')\">";
        htmlStr+="<span>&nbsp登&nbsp&nbsp录&nbsp</span>";
        htmlStr+="</button>";
        $("#login-btn-div").html(htmlStr);
    }
}
//调用library
function  getLibrarySession(uid){
    var uid=uid;
    if(typeof(uid)!="undefined"){
        getLibraryBySession(0,18,uid);
    }
}
function  getLibraryBySession(pageNo,pageSize,uid){
    var uid=uid;
    if(typeof(uid)!="undefined"){
        var pageNo=pageNo;
        var pageSize=pageSize;
        $.ajax({
            url:'library.do',
            data:{
                uid:uid,
                pageNo:pageNo,
                pageSize:pageSize
            },
            type:'post',
            dataType:'json',
            success:function(data){
                var htmlStr="";
                $.each(data.allList,function (index,obj){
                    htmlStr+="<div class=\"col-md-2 column\" onclick=\"window.open('album/info?alid="+obj.alid+"','_self')\">";;
                    htmlStr+="    <img src=\"assets/images/album/"+obj.alid+".jpg\" class=\"album-i box\">";
                    htmlStr+="    <div class=\"album-text\">";
                    htmlStr+="    <div class=\"album-text-title\">"+obj.title+"</div>";
                    htmlStr+="    <div class=\"album-text-artist\">"+obj.artists+"</div>";
                    htmlStr+="</div></div>";
                })
                $("#list-album").html(htmlStr);
                var totalPages=1;
                if(data.allRows%pageSize==0){
                    totalPages=data.allRows/pageSize;
                }else
                    totalPages=parseInt(data.allRows/pageSize)+1;
                $('#pageLimit').bootstrapPaginator({
                    currentPage: data.pageNo,
                    totalPages: totalPages,
                    size:"normal",
                    bootstrapMajorVersion: 3,
                    alignment:"right",
                    numberOfPages:5,
                    itemTexts: function (type, page, current) {
                        switch (type) {
                            case "first": return "首页";
                            case "prev": return "上一页";
                            case "next": return "下一页";
                            case "last": return "末页";
                            case "page": return page;
                        }
                    },
                    onPageClicked : function(event, originalEvent, type, page) {
                        var selectNo=0;
                        if(page==1){
                            selectNo=0;
                        }else{
                            selectNo=(page-1)*pageSize;
                        }
                        getAllAlbum(uid,selectNo,pageSize)
                    }
                })
            }
        })

    }
}
//获取专辑信息
function getAlbumInfo(){
    var rid =window.location.search;
    $.ajax({
        url:'album/info.do'+ rid,
        type:'post',
        dataType:'json',
        success:function(data){
            $("#Alid").val(data.alid);
            $("#title").text(data.title);
            $("#artist").text(data.artists);
            $("#label").text(data.label);
            document.getElementById('label').href="labelAlbum?lid="+data.lid;
            $("#created").text(data.created);
            $("#rc").text(data.rc)
            $("#album-about").text(data.text)
            $("#created-f").text(data.created);
            document.getElementById('album-image').src="assets/images/album/"+data.alid+".jpg";
            $.ajax({
                url:'album/music/list.do',
                data:{
                    alid:data.alid
                },
                type:'post',
                dataType:'json',
                success:function(data){
                    $("#allRows").text(data.allRows);
                    var htmlStr="";
                    $.each(data.allList,function (index,obj){
                        htmlStr+="<div type=\"button\" class=\"album-play-list-one col-md-12 btn btn-default\" onclick=\"getMidToPlay("+obj.mid+")\">";
                        htmlStr+="    <div class=\"album-play-list-one\">";
                        htmlStr+="      <div class=\"col-md-11 album-play-list-one\">";
                        htmlStr+="          <div class=\"album-play-list-num\">"+(index+1)+"</div>";
                        htmlStr+="          <div class=\"col-md-9\">"+obj.name+"</div>";
                        htmlStr+="      </div>";
                        htmlStr+="      <div class=\"col-md-1 album-play-list-one\">";
                        htmlStr+="      <div class=\"album-play-list-time pull-right\">"+obj.min+"</div>";
                        htmlStr+="      </div></div></div>";
                    })
                    $("#albumMusicList").html(htmlStr);
                }
            })
        }
    })
}
//如果没有登录，就隐藏收藏按钮
function  getSessionAdd(uid){
    var uid=uid;
    var rid =window.location.search;
    if(typeof(uid)!="undefined"){
        $.ajax({
            url:'library/reCheck.do'+ rid,
            type:'post',
            data:{
                uid:uid
            },
            dataType:'json',
            success:function(data){
                if(data.code=="1"){
                    var button=document.querySelector('#del-btn');
                    button.style="display:none";
                }
                if(data.code=="0"){
                    var button=document.querySelector('#add-btn');
                    button.style="display:none";

                }
            }
        })
    }else{
        var button=document.querySelector('#add-btn');
        button.style="display:none";
        var button=document.querySelector('#del-btn');
        button.style="display:none"
    }
}
//获取歌手页面信息
function getArtistInfo(){
    var rid =window.location.search;
    $.ajax({
        url:'artist/info.do'+ rid,
        type:'post',
        dataType:'json',
        success:function(data){
            $("#name").text(data.name);
            $("#about").text(data.about);
            $("#dob").text(data.dob);
            var image=document.querySelector('#artist-image');
            image.style="background:url(\"assets/images/artist/"+data.aid+".jpg\");background-size: 100% auto;background-repeat: no-repeat;";
        }
    })
}
function getArtistAlbum(){
    var rid =window.location.search;
    $.ajax({
        url:'album/artist.do'+ rid,
        type:'post',
        dataType:'json',
        success:function(data){
            var htmlStr="";
            $.each(data.allList,function (index,obj){
                htmlStr+="<div class=\"col-md-2 column\" onclick=\"window.open('album/info?alid="+obj.alid+"','_self')\">";
                htmlStr+="    <img src=\"assets/images/album/"+obj.alid+".jpg\" class=\"album-i box\">";
                htmlStr+="    <div class=\"album-text\">";
                htmlStr+="    <div class=\"album-text-title\">"+obj.title+"</div>";
                htmlStr+="    <div class=\"album-text-artist\">"+obj.artists+"</div>";
                htmlStr+="</div></div>";
            })
            $("#list-album").html(htmlStr);
        }
    })
}

function getMidToPlay(mid){
    window.parent.postMessage(mid,'/');
}


function getIndexCommend(){
    $.ajax({
        url:'commend/list.do',
        type:'post',
        dataType:'json',
        success:function(data){
            var htmlStr="";
            $.each(data.allList,function (index,obj){
                htmlStr+="<div class=\"col-md-4 column\" onclick=\"window.open('album/info?alid="+obj.alid+"','_self')\">";
                htmlStr+="    <p class=\"commend-n\">"+obj.name+"</p>";
                htmlStr+="    <h3 class=\"commend-t\">"+obj.title+"</h3>";
                htmlStr+="    <div class=\"commend-s\">"+obj.subtitle+"</div>";
                htmlStr+="    <img src=\"assets/images/commend/"+obj.id+".jpg\" class=\"box commend-i\">";
                htmlStr+="</div>";
            })
            $("#index-commend").html(htmlStr);
        }
    })
}
function getIndexAlbum(name,pageNo,pageSize){
    var name=name;
    var pageNo=pageNo;
    var pageSize=pageSize;
    $.ajax({
        url:'album/list.do',
        data:{
            name:name,
            pageNo:pageNo,
            pageSize:pageSize
        },
        type:'post',
        dataType:'json',
        success:function(data){
            var htmlStr="";
            $.each(data.allList,function (index,obj){
                htmlStr+="<div class=\"col-md-2 column\" onclick=\"window.open('album/info?alid="+obj.alid+"','_self')\">";
                htmlStr+="    <img src=\"assets/images/album/"+obj.alid+".jpg\" class=\"album-i box\">";
                htmlStr+="    <div class=\"album-text\">";
                htmlStr+="    <div class=\"album-text-title\">"+obj.title+"</div>";
                htmlStr+="    <div class=\"album-text-artist\">"+obj.artists+"</div>";
                htmlStr+="</div></div>";
            })
            $("#list-album").html(htmlStr);
        }
    })
}
function getIndexArtist(name,pageNo,pageSize){
    var name=name;
    var pageNo=pageNo;
    var pageSize=pageSize;
    $.ajax({
        url:'artist/list.do',
        data:{
            name:name,
            pageNo:pageNo,
            pageSize:pageSize
        },
        type:'post',
        dataType:'json',
        success:function(data){
            var htmlStr="";
            $.each(data.allList,function (index,obj){
                htmlStr+="<div class=\"col-md-2 column\" onclick=\"window.open('artist/info?aid="+obj.aid+"','_self')\">";
                htmlStr+="    <img src=\"assets/images/artist_f/"+obj.aid+".jpg\" class=\"artist-f\">";
                htmlStr+="    <div class=\"artist-text\">";
                htmlStr+="    <div class=\"artist-text-artist\">"+obj.name+"</div>";
                htmlStr+="</div></div>";
            })
            $("#index-artist").html(htmlStr);
        }
    })
}


function getAllAlbum(name,pageNo,pageSize){
    var name=name;
    var pageNo=pageNo;
    var pageSize=pageSize;
    $.ajax({
        url:'album/list.do',
        data:{
            name:name,
            pageNo:pageNo,
            pageSize:pageSize
        },
        type:'post',
        dataType:'json',
        success:function(data){
            var htmlStr="";
            $.each(data.allList,function (index,obj){
                htmlStr+="<div class=\"col-md-2 column\" onclick=\"window.open('album/info?alid="+obj.alid+"','_self')\">";;
                htmlStr+="    <img src=\"assets/images/album/"+obj.alid+".jpg\" class=\"album-i box\">";
                htmlStr+="    <div class=\"album-text\">";
                htmlStr+="    <div class=\"album-text-title\">"+obj.title+"</div>";
                htmlStr+="    <div class=\"album-text-artist\">"+obj.artists+"</div>";
                htmlStr+="</div></div>";
            })
            $("#list-album").html(htmlStr);
            var totalPages=1;
            if(data.allRows%pageSize==0){
                totalPages=data.allRows/pageSize;
            }else
                totalPages=parseInt(data.allRows/pageSize)+1;
            $('#pageLimit').bootstrapPaginator({
                currentPage: data.pageNo,
                totalPages: totalPages,
                size:"normal",
                bootstrapMajorVersion: 3,
                alignment:"right",
                numberOfPages:5,
                itemTexts: function (type, page, current) {
                    switch (type) {
                        case "first": return "首页";
                        case "prev": return "上一页";
                        case "next": return "下一页";
                        case "last": return "末页";
                        case "page": return page;
                    }
                },
                onPageClicked : function(event, originalEvent, type, page) {
                    var selectNo=0;
                    if(page==1){
                        selectNo=0;
                    }else{
                        selectNo=(page-1)*pageSize;
                    }
                    getAllAlbum("",selectNo,pageSize)
                }
            })
        }
    })
}

function getAllAlbum(pageNo,pageSize){
    var rid =window.location.search;
    var pageNo=pageNo;
    var pageSize=pageSize;
    $.ajax({
        url:'label/album.do'+rid,
        data:{
            pageNo:pageNo,
            pageSize:pageSize
        },
        type:'post',
        dataType:'json',
        success:function(data){
            var htmlStr="";
            $.each(data.allList,function (index,obj){
                htmlStr+="<div class=\"col-md-2 column\" onclick=\"window.open('album/info?alid="+obj.alid+"','_self')\">";;
                htmlStr+="    <img src=\"assets/images/album/"+obj.alid+".jpg\" class=\"album-i box\">";
                htmlStr+="    <div class=\"album-text\">";
                htmlStr+="    <div class=\"album-text-title\">"+obj.title+"</div>";
                htmlStr+="    <div class=\"album-text-artist\">"+obj.artists+"</div>";
                htmlStr+="</div></div>";
            })
            $("#list-album").html(htmlStr);
            var totalPages=1;
            if(data.allRows%pageSize==0){
                totalPages=data.allRows/pageSize;
            }else
                totalPages=parseInt(data.allRows/pageSize)+1;
            $('#pageLimit').bootstrapPaginator({
                currentPage: data.pageNo,
                totalPages: totalPages,
                size:"normal",
                bootstrapMajorVersion: 3,
                alignment:"right",
                numberOfPages:5,
                itemTexts: function (type, page, current) {
                    switch (type) {
                        case "first": return "首页";
                        case "prev": return "上一页";
                        case "next": return "下一页";
                        case "last": return "末页";
                        case "page": return page;
                    }
                },
                onPageClicked : function(event, originalEvent, type, page) {
                    var selectNo=0;
                    if(page==1){
                        selectNo=0;
                    }else{
                        selectNo=(page-1)*pageSize;
                    }
                    getAllAlbum("",selectNo,pageSize)
                }
            })
        }
    })
}

function getAllArtist(name,pageNo,pageSize){
    var name=name;
    var pageNo=pageNo;
    var pageSize=pageSize;
    $.ajax({
        url:'artist/list.do',
        data:{
            name:name,
            pageNo:pageNo,
            pageSize:pageSize
        },
        type:'post',
        dataType:'json',
        success:function(data){
            var htmlStr="";
            $.each(data.allList,function (index,obj){
                htmlStr+="<div class=\"col-md-2 column\" onclick=\"window.open('artist/info?aid="+obj.aid+"','_self')\">";
                htmlStr+="    <img src=\"assets/images/artist_f/"+obj.aid+".jpg\" class=\"artist-f\">";
                htmlStr+="    <div class=\"artist-text\">";
                htmlStr+="    <div class=\"artist-text-artist\">"+obj.name+"</div>";
                htmlStr+="</div></div>";
            })
            $("#list-album").html(htmlStr);
            var totalPages=1;
            if(data.allRows%pageSize==0){
                totalPages=data.allRows/pageSize;
            }else
                totalPages=parseInt(data.allRows/pageSize)+1;
            $('#pageLimit').bootstrapPaginator({
                currentPage: data.pageNo,
                totalPages: totalPages,
                size:"normal",
                bootstrapMajorVersion: 3,
                alignment:"right",
                numberOfPages:5,
                itemTexts: function (type, page, current) {
                    switch (type) {
                        case "first": return "首页";
                        case "prev": return "上一页";
                        case "next": return "下一页";
                        case "last": return "末页";
                        case "page": return page;
                    }
                },
                onPageClicked : function(event, originalEvent, type, page) {
                    var selectNo=0;
                    if(page==1){
                        selectNo=0;
                    }else{
                        selectNo=(page-1)*pageSize;
                    }
                    getAllArtist("",selectNo,pageSize)
                }
            })
        }
    })
}

function getLabel(pageNo,pageSize){
    var pageNo=pageNo;
    var pageSize=pageSize;
    $.ajax({
        url:'label/list.do',
        data:{
            pageNo:pageNo,
            pageSize:pageSize
        },
        type:'post',
        dataType:'json',
        success:function(data){
            var htmlStr="";
            htmlStr+="<div class=\"col-md-12 column\">";
            $.each(data.allList,function (index,obj){
                htmlStr+="    <div class=\"label-unit col-md-5 column\" onclick=\"window.open('labelAlbum?lid="+obj.lid+"','_self')\">";
                htmlStr+="    <h3>"+obj.name+"</h3>";
                htmlStr+="    </div>";
            })
            htmlStr+="    </div>";
            $("#list-label").html(htmlStr);
            var totalPages=1;
            if(data.allRows%pageSize==0){
                totalPages=data.allRows/pageSize;
            }else
                totalPages=parseInt(data.allRows/pageSize)+1;
            $('#pageLimit').bootstrapPaginator({
                currentPage: data.pageNo,
                totalPages: totalPages,
                size:"normal",
                bootstrapMajorVersion: 3,
                alignment:"right",
                numberOfPages:5,
                itemTexts: function (type, page, current) {
                    switch (type) {
                        case "first": return "首页";
                        case "prev": return "上一页";
                        case "next": return "下一页";
                        case "last": return "末页";
                        case "page": return page;
                    }
                },
                onPageClicked : function(event, originalEvent, type, page) {
                    var selectNo=0;
                    if(page==1){
                        selectNo=0;
                    }else{
                        selectNo=(page-1)*pageSize;
                    }
                    getAllAlbum(selectNo,pageSize)
                }
            })
        }
    })
}

function dataURLtoBlob(dataurl) {
    var arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1],
        bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
    while (n--) {
        u8arr[n] = bstr.charCodeAt(n);
    }
    return new Blob([u8arr], { type: mime });
}

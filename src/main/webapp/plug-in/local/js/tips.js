/**
 * Created by Administrator on 2017/5/26.
 */
function alertX(msg){
    var modal = '<div class="modal fade" id="myModal" tabindex="-1" role="dialog" style="margin-top: 50px;">'+
            '<div class="modal-dialog modal-sm" role="document">'+
            '<div class="modal-content">'+
            '<div class="modal-header">'+
            '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
            '<h6 class="modal-title" id="myModalLabel">信息提示</h6>'+
            '</div>'+
            '<div class="modal-body text-center">'+msg+'</div>'+
            '<div class="modal-footer">'+
            '<button type="button" class="btn btn-primary closed-btn">确定</button>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>';
    $(modal).appendTo("body");
    $("#myModal").modal({
        show:true,
        backdrop:'static'
    });
    $(".close,.closed-btn").click(function(){
        closeX();
    })
}
function loadingX(msg) {
    var modal = '<div class="modal" id="myModal" tabindex="-1" role="dialog">'+
        '<div class="modal-dialog" role="document" style="margin-top: 0">'+
        '<div class="modal-content" style="width:100px;height:60px;margin:0 auto;text-align: center;">'+
        '<div class="modal-body" style="padding:5px 0 0 0;"><i class="fa fa-pulse fa-spinner" style="font-size: 28px;"></i><p style="margin: 4px">'+msg+'</p></div>'+
        '</div>'+
        '</div>'+
        '</div>';
    $(modal).appendTo("body");
    $("#myModal").modal({
        show:true,
        backdrop:'static'
    }).css({
        "margin-top": function () {
            return  ($(this).height() / 2) - ($(".modal-content").height() / 2);
        }
    })
}
function confirmX(msg,callback){
    var modal = '<div class="modal fade" id="myModal" tabindex="-1" role="dialog" style="margin-top: 50px;">'+
        '<div class="modal-dialog modal-sm" role="document">'+
        '<div class="modal-content">'+
        '<div class="modal-header">'+
        '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
        '<h6 class="modal-title" id="myModalLabel">信息提示</h6>'+
        '</div>'+
        '<div class="modal-body">'+msg+'</div>'+
        '<div class="modal-footer">'+
        '<button type="button" class="btn btn-primary ok-btn ">确定</button>'+
        '<button type="button" class="btn btn-default close-btn" data-dismiss="modal">取消</button>'+
        '</div>'+
        '</div>'+
        '</div>'+
        '</div>';
    $(modal).appendTo("body");
    $("#myModal").modal({
        show:true,
        backdrop:'static'
    });
    $(".ok-btn").click(function () {
        closeX();
        callback();
    });
    $(".close,.close-btn").click(function () {
        closeX()
    })
}
function  confirmB(msg,callback) {
    var modal = '<div class="modal fade" id="myModal" tabindex="-1" role="dialog" style="margin-top: 50px;">'+
        '<div class="modal-dialog modal-sm" role="document">'+
        '<div class="modal-content">'+
        '<div class="modal-header">'+
        '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
        '<h6 class="modal-title" id="myModalLabel">信息提示</h6>'+
        '</div>'+
        '<div class="modal-body">'+msg+'</div>'+
        '<div class="modal-footer">'+
        '<button type="button" class="btn btn-primary ok-btn ">确定</button>'+
        '</div>'+
        '</div>'+
        '</div>'+
        '</div>';
    $(modal).appendTo("body");
    $("#myModal").modal({
        show:true,
        backdrop:'static'
    });
    $(".ok-btn").click(function () {
        closeX();
        callback();
    });
    $(".close").click(function () {
        closeX()
    })
}
function msgX(msg){
    var modal = '<div class="modal" id="myModal" tabindex="-1" role="dialog">'+
        '<div class="modal-dialog" role="document" style="margin-top: 0">'+
        '<div class="modal-content" style="width:150px;margin:0 auto;text-align: center;">'+
        '<div class="modal-body">'+msg+'</div>'+
        '</div>'+
        '</div>'+
        '</div>';
    $(modal).appendTo("body");
    $("#myModal").modal({
        show:true,
        backdrop:'static'
    }).css({
        "margin-top": function () {
            return  ($(this).height() / 2) - ($(".modal-content").height() / 2);
        }
    })
    setTimeout(closeX,1500)
}
function msgB(msg,callback){
    var modal = '<div class="modal" id="myModal" tabindex="-1" role="dialog">'+
        '<div class="modal-dialog" role="document" style="margin-top: 0">'+
        '<div class="modal-content" style="width:150px;margin:0 auto;text-align: center;">'+
        '<div class="modal-body">'+msg+'</div>'+
        '</div>'+
        '</div>'+
        '</div>';
    $(modal).appendTo("body");
    $("#myModal").modal({
        show:true,
        backdrop:'static'
    }).css({
        "margin-top": function () {
            return  ($(this).height() / 2) - ($(".modal-content").height() / 2);
        }
    })
    setTimeout(function () {
        closeX();
        callback();
    },1500)
}
function closeX(){
    $(".modal,.modal-backdrop").remove();
}
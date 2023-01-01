<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebar.jsp"%>

<div class="box box-success">
   <div class="box-header ui-sortable-handle" style="cursor: move;">
      <i class="fa fa-comments-o"></i>
      <h3 class="box-title">${vo.c_title }</h3>
<!--       <div class="box-tools pull-right" data-toggle="tooltip" title="" -->
<!--          data-original-title="Status"> -->
<!--          <div class="btn-group" data-toggle="btn-toggle"> -->
<!--             <button type="button" class="btn btn-default btn-sm active"> -->
<!--                <i class="fa fa-square text-green"></i> -->
<!--             </button> -->
<!--             <button type="button" class="btn btn-default btn-sm"> -->
<!--                <i class="fa fa-square text-red"></i> -->
<!--             </button> -->
<!--          </div> -->
<!--       </div> -->
   </div>
   <div class="slimScrollDiv"
      style="position: relative; overflow: hidden; width: auto; height: 250px;">
      <div class="box-body chat" id="chat-box"
         style="overflow: hidden; width: auto; height: 250px;">

         <div class="item">
            <img src="dist/img/user4-128x128.jpg" alt="user image"
               class="online">
            <p class="message">
               <a href="#" class="name"> <small class="text-muted pull-right"><i
                     class="fa fa-clock-o"></i> 2:15</small> Mike Doe
               </a> 웹소켓 구현 어케하누 ~
            </p>
            
<!--             채팅 첨부파일 양식  -->
<!--             <div class="attachment"> -->
<!--                <h4>Attachments:</h4> -->
<!--                <p class="filename">Theme-thumbnail-image.jpg</p> -->
<!--                <div class="pull-right"> -->
<!--                   <button type="button" class="btn btn-primary btn-sm btn-flat">Open</button> -->
<!--                </div> -->
<!--             </div> -->

         </div>


         <div class="item">
            <img src="dist/img/user3-128x128.jpg" alt="user image"
               class="offline">
            <p class="message">
               <a href="#" class="name"> <small class="text-muted pull-right"><i
                     class="fa fa-clock-o"></i> 5:15</small> Alexander Pierce
               </a> 어 케 하 누 !
            </p>
         </div>


         <div class="item">
            <img src="dist/img/user2-160x160.jpg" alt="user image"
               class="offline">
            <p class="message">
               <a href="#" class="name"> <small class="text-muted pull-right"><i
                     class="fa fa-clock-o"></i> 5:30</small> Susan Doe
               </a> 왜 안 되 누 !
            </p>
         </div>

      </div>
      <div class="slimScrollBar"
         style="background: rgb(0, 0, 0); width: 7px; position: absolute; top: 66px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 184.366px;"></div>
      <div class="slimScrollRail"
         style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
   </div>

<div class="input_msg_write">
 <input type="text" class="write_msg" id="messageinput" placeholder="Type a message" />
 <button class="msg_send_btn" onclick="send();"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
<!--  <div class="input-group-btn"> -->
<!--             <button type="button" class="btn btn-success"> -->
<!--                <i class="fa fa-plus"></i> -->
<!--             </button> -->
<!--          </div> -->
</div>

<!--    <div class="box-footer"> -->
<!--       <div class="input-group"> -->
<!--          <input class="form-control" placeholder="Type message..."> -->
<!--          <div class="input-group-btn"> -->
<!--             <button type="button" class="btn btn-success"> -->
<!--                <i class="fa fa-plus"></i> -->
<!--             </button> -->
<!--          </div> -->
<!--       </div> -->
<!--    </div> -->
</div>





</div>
<%@ include file="../include/footer.jsp"%>
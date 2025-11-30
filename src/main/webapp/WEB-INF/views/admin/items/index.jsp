
<%--
Document   : index
    Created on : Jul 5, 2018, 6:28:08 PM
    Author     : dell
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../shared/header.jsp" %>
<h1>Items</h1>
<div class="pull-right">
    <p>
        <a href="${SITE_URL}/admin/items/add" class="btn btn-primary">Add Items</a>
    </p>
</div>

<table class="table">
    <tr>
        <th>#</th>
        <th>Name</th>
        <th>Added Date</th>
        <th>Modified Date</th>
        <th>Status</th>
        <th>Action</th>
    </tr>
    <c:set var="serialNumber" value="1" />
    <c:forEach var="item" items="${items}">
        <tr class="row-${item.id}">
            <td>${serialNumber}</td>
            <td>${item.name}</td>
            <td>${item.createdDate}</td>
            <td>${item.modifiedDate}</td>
            <td>
                <input type="checkbox" disabled="disabled" 
                       <c:if test="${item.status == 'true'}">checked</c:if> />
            </td>
            <td>
                <a href="${SITE_URL}/admin/items/edit/${item.id}" class="btn btn-secondary">
                    <i class="bi bi-pencil"></i>
                </a>
                <a href="#" class="btn btn-secondary">
                   <i class="bi bi-archive"></i>
                </a>
            </td>
        </tr>
        <c:set var="serialNumber" value="${serialNumber + 1}" />
    </c:forEach>
</table>

  
  <!-- Modal -->
  <div class="modal fade" id="treatment-dialog" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title"></h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <form id="treatment-form">
            <div class="modal-body">
                <div class="mb-3">
                    <label>Subject:</label>
                    <input type="text" name="subject" class="form-control" required="required"/>
                </div>
                <div class="mb-3">
                    <label>Message:</label>
                    <textarea type="text" name="message" class="form-control" required="required" style="height:150px"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <input type="hidden" id="treatment-item-id" name="item.id"/>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="save-treatment-btn btn btn-primary">Add Treatment</button>
            </div>
        </form>
      </div>
    </div>
  </div>
  <script>
        $(document).ready(function(){
            $(".add-treatment-btn").click(function() {
                var $id=$(this).attr('data-id');
                $("#treatment-item-id").val($id);
                $("#treatment-dialog").find('.modal-title')
                .html($(this).attr('data-item-name'));
                $("#treatment-dialog").modal();
                $(".save-treatment-btn").click(function() {
                    $.post('${SITE_URL}/admin/item/addTreatment',
                    $("#treatment-form").serialize(), function(res) {
                        if(res.trim()==='success') {
                            var $spanTotal=$(".row-"+$id).find(".total-treatments");
                            var $count=parseInt($spanTotal.html());
                            $spanTotal.html($count+1);
                            $("#treatment-dialog").modal('hide');
                        }    
                    });
                    return false;
                });
            });
        });
  </script>
<%@include file="../shared/footer.jsp" %>
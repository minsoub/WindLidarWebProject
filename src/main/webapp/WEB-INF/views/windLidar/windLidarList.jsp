<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>first</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<body>
<h2>WindLidar Data List</h2>
<table style="border:1px solid #ccc">
    <colgroup>
        <col width="8%"/>
        <col width="8%"/>
        <col width="8%"/>
        <col width="8%"/>
        <col width="8%"/>
        <col width="8%"/>
        <col width="8%"/>
        <col width="8%"/>
        <col width="8%"/>
        <col width="8%"/>
        <col width="8%"/>
        <col width="8%"/>
    </colgroup>
    <thead>
        <tr>
            <th scope="col">No</th>
            <th scope="col">Code</th>
            <th scope="col">Year</th>
            <th scope="col">Month</th>
            <th scope="col">Day</th>
            <th scope="col">HOUR</th>
            <th scope="col">Minute</th>
            <th scope="col">SEC</th>
            <th scope="col">File Count</th>
            <th scope="col">Use Check</th>
            <th scope="col">REG dt</th>
            <th scope="col">UPT dt</th>
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${fn:length(list) > 0}">
                <c:forEach items="${list }" var="row">
                    <tr>
                        <td>${row.NO }</td>
                        <td>${row.S_CODE }</td>
                        <td>${row.S_YEAR }</td>
                        <td>${row.S_MON }</td>
                        <td>${row.S_DAY }</td>
                        <td>${row.S_HOUR }</td>
                        <td>${row.S_MIN }</td>
                        <td>${row.S_SEC }</td>
                        <td>${row.FILE_CNT }</td>
                        <td>${row.USE_CHK }</td>
                        <td>${row.REG_DT }</td>
                        <td>${row.UPT_DT }</td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="4">조회된 결과가 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>     
    </tbody>
</table>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Information System</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background: #f5f5f5; }

        .header {
            background: #2e7d32;
            color: white;
            padding: 15px 20px;
            font-size: 24px;
            font-weight: bold;
        }

        .content {
            max-width: 1100px;
            margin: 20px auto;
            background: white;
            padding: 20px;
            border-radius: 4px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.12);
        }

        .content h2 {
            text-align: center;
            margin-bottom: 15px;
            color: #333;
        }

        .btn-group { margin-bottom: 15px; }

        .btn {
            display: inline-block;
            padding: 8px 16px;
            border: none;
            border-radius: 3px;
            color: white;
            text-decoration: none;
            font-size: 14px;
            cursor: pointer;
            margin-right: 8px;
        }
        .btn-add-student { background: #c62828; }
        .btn-add-student:hover { background: #b71c1c; }
        .btn-add-score { background: #2e7d32; }
        .btn-add-score:hover { background: #1b5e20; }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th {
            background: #2e7d32;
            color: white;
            padding: 10px 8px;
            text-align: center;
            font-size: 14px;
        }
        td {
            padding: 10px 8px;
            text-align: center;
            border-bottom: 1px solid #ddd;
            font-size: 14px;
        }
        tr:hover { background: #f1f8e9; }

        .edit-icon {
            color: #666;
            text-decoration: none;
            font-size: 16px;
        }
        .edit-icon:hover { color: #2e7d32; }
    </style>
</head>
<body>

<div class="header">Student Information System</div>

<div class="content">
    <h2>Student Information</h2>

    <div class="btn-group">
        <a href="${pageContext.request.contextPath}/student" class="btn btn-add-student">+ Student</a>
        <a href="${pageContext.request.contextPath}/score" class="btn btn-add-score">+ Score</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>Id</th>
                <th>Student Id</th>
                <th>Student Name</th>
                <th>Subject Name</th>
                <th>Score 1</th>
                <th>Score 2</th>
                <th>Credit</th>
                <th>Grade</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="sc" items="${scores}" varStatus="loop">
                <tr>
                    <td>${loop.index + 1}</td>
                    <td>${sc.student.studentCode}</td>
                    <td>${sc.student.fullName}</td>
                    <td>${sc.subject.subjectName}</td>
                    <td><fmt:formatNumber value="${sc.score1}" pattern="0.0"/></td>
                    <td><fmt:formatNumber value="${sc.score2}" pattern="0.0"/></td>
                    <td>${sc.subject.credit}</td>
                    <td>${sc.grade}</td>
                    <td><a href="#" class="edit-icon" title="Edit">&#9998;</a></td>
                </tr>
            </c:forEach>
            <c:if test="${empty scores}">
                <tr><td colspan="9">No records found.</td></tr>
            </c:if>
        </tbody>
    </table>
</div>

</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Score</title>
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
            max-width: 500px;
            margin: 30px auto;
            background: white;
            padding: 30px;
            border-radius: 4px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.12);
        }

        .content h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #ccc;
            border-radius: 3px;
            font-size: 14px;
        }

        .btn-group {
            margin-top: 20px;
            text-align: center;
        }
        .btn {
            padding: 10px 24px;
            border: none;
            border-radius: 3px;
            color: white;
            font-size: 14px;
            cursor: pointer;
            text-decoration: none;
            margin: 0 5px;
        }
        .btn-save { background: #2e7d32; }
        .btn-save:hover { background: #1b5e20; }
        .btn-cancel { background: #757575; }
        .btn-cancel:hover { background: #616161; }
    </style>
</head>
<body>

<div class="header">Student Information System</div>

<div class="content">
    <h2><c:choose><c:when test="${isEdit}">Edit Score</c:when><c:otherwise>Add Score</c:otherwise></c:choose></h2>

    <form action="${pageContext.request.contextPath}/score" method="post">
        <c:if test="${isEdit}">
            <input type="hidden" name="scoreId" value="${score.studentScoreId}">
        </c:if>

        <div class="form-group">
            <label for="studentId">Student:</label>
            <select id="studentId" name="studentId" required>
                <option value="">-- Select Student --</option>
                <c:forEach var="s" items="${students}">
                    <option value="${s.studentId}" ${score != null && score.student.studentId == s.studentId ? 'selected' : ''}>
                        ${s.studentCode} - ${s.fullName}
                    </option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="subjectId">Subject:</label>
            <select id="subjectId" name="subjectId" required>
                <option value="">-- Select Subject --</option>
                <c:forEach var="sub" items="${subjects}">
                    <option value="${sub.subjectId}" ${score != null && score.subject.subjectId == sub.subjectId ? 'selected' : ''}>
                        ${sub.subjectCode} - ${sub.subjectName}
                    </option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="score1">Score 1:</label>
            <input type="number" id="score1" name="score1" step="0.1" min="0" max="10" required placeholder="0.0 - 10.0" value="${score != null ? score.score1 : ''}">
        </div>
        <div class="form-group">
            <label for="score2">Score 2:</label>
            <input type="number" id="score2" name="score2" step="0.1" min="0" max="10" required placeholder="0.0 - 10.0" value="${score != null ? score.score2 : ''}">
        </div>
        <div class="btn-group">
            <button type="submit" class="btn btn-save"><c:choose><c:when test="${isEdit}">Update</c:when><c:otherwise>Save</c:otherwise></c:choose></button>
            <a href="${pageContext.request.contextPath}/display" class="btn btn-cancel">Cancel</a>
        </div>
    </form>
</div>

</body>
</html>

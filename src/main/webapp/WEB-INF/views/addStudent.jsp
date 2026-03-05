<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Student</title>
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
        .form-group input {
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
    <h2>Add New Student</h2>

    <form action="${pageContext.request.contextPath}/student" method="post" accept-charset="UTF-8">
        <div class="form-group">
            <label for="studentCode">Student Code:</label>
            <input type="text" id="studentCode" name="studentCode" required placeholder="e.g. 2007A10">
        </div>
        <div class="form-group">
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" required placeholder="e.g. Nguyen Van A">
        </div>
        <div class="form-group">
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" placeholder="e.g. Ha Noi">
        </div>
        <div class="btn-group">
            <button type="submit" class="btn btn-save">Save</button>
            <a href="${pageContext.request.contextPath}/display" class="btn btn-cancel">Cancel</a>
        </div>
    </form>
</div>

</body>
</html>

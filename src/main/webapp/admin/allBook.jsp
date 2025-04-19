<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Books - Take n' Read</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }

        body {
            background: #F9FAFB;
            min-height: 100vh;
            color: #374151;
        }

        header {
            background: #FFFFFF;
            padding: 12px 40px;
            border-bottom: 1px solid #A3BFFA;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
        }

        .logo {
            display: flex;
            align-items: center;
            font-size: 26px;
            font-weight: 700;
            color: #374151;
        }

        .logo i {
            margin-right: 10px;
            color: #A3BFFA;
            font-size: 22px;
        }

        nav {
            background: #6B7280;
            padding: 10px 40px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        nav a {
            color: #FFFFFF;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            padding: 8px 16px;
            border-radius: 20px;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            transition: background 0.3s ease, color 0.3s ease;
        }

        nav a:hover {
            background: #A3BFFA;
            color: #FFFFFF;
        }

        nav a i {
            color: #A3BFFA;
            font-size: 14px;
        }

        .main-content {
            padding: 30px 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .main-content h1 {
            font-size: 26px;
            color: #374151;
            margin-bottom: 20px;
            text-align: center;
            font-weight: 700;
        }

        .table-controls {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .search-bar {
            display: flex;
            align-items: center;
            background: #FFFFFF;
            border: 1px solid #D1D5DB;
            border-radius: 8px;
            padding: 8px 12px;
            width: 300px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .search-bar:hover, .search-bar:focus-within {
            border-color: #A3BFFA;
            box-shadow: 0 0 8px rgba(163, 191, 250, 0.3);
        }

        .search-bar input {
            border: none;
            outline: none;
            font-size: 14px;
            color: #374151;
            width: 100%;
        }

        .search-bar input::placeholder {
            color: #9CA3AF;
        }

        .search-bar i {
            color: #4B5563;
            margin-right: 8px;
        }

        .add-book-link {
            padding: 8px 16px;
            border: none;
            border-radius: 8px;
            background: #A3BFFA;
            color: #FFFFFF;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 6px;
            text-decoration: none;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .add-book-link:hover {
            background: #7C9BF2;
            transform: scale(1.05);
        }

        .table-container {
            background: #FFFFFF;
            border-radius: 16px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.15);
            overflow-x: auto;
            animation: fadeIn 0.5s ease-out;
            border: 1px solid #E5E7EB;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
            color: #374151;
        }

        thead {
            background: linear-gradient(135deg, #6B7280, #4B5563);
            color: #FFFFFF;
        }

        th {
            padding: 10px 12px;
            text-align: center;
            font-weight: 500;
            text-transform: uppercase;
            font-size: 13px;
        }

        th.title, th.author {
            text-align: left;
        }

        tbody tr {
            border-bottom: 1px solid #E5E7EB;
            transition: background 0.2s ease;
        }

        tbody tr:nth-child(even) {
            background: #F9FAFB;
        }

        tbody tr:hover {
            background: #E8EDFF;
        }

        td {
            padding: 10px 12px;
            font-size: 14px;
            font-weight: 400;
            text-align: center;
            border-right: 1px solid #E5E7EB;
        }

        td:last-child {
            border-right: none;
        }

        td.title, td.author {
            text-align: left;
        }

        td.price::before {
            content: 'Rs ';
            color: #4B5563;
        }

        td.category {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
        }

        td.category i {
            color: #A3BFFA;
            font-size: 12px;
        }

        td.status {
            font-weight: 500;
        }

        td.status.active {
            color: #A3BFFA;
        }

        td.status.inactive {
            color: #6B7280;
        }

        td.action {
            display: flex;
            justify-content: center;
            gap: 12px;
        }

        .action-btn {
            padding: 8px 14px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease, box-shadow 0.2s ease;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .action-btn.edit {
            background: #A3BFFA;
            color: #FFFFFF;
        }

        .action-btn.edit:hover {
            background: #7C9BF2;
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .action-btn.delete {
            background: #F87171;
            color: #FFFFFF;
        }

        .action-btn.delete:hover {
            background: #DC2626;
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .action-btn i {
            font-size: 13px;
        }

        .no-books {
            display: none;
            text-align: center;
            color: #6B7280;
            font-size: 14px;
            font-weight: 500;
            padding: 20px;
        }

        .no-books.show {
            display: table-row;
        }

        footer {
            background: #FFFFFF;
            padding: 15px 40px;
            text-align: center;
            color: #6B7280;
            font-size: 14px;
            border-top: 1px solid #A3BFFA;
            margin-top: 30px;
        }

        @media (max-width: 768px) {
            header {
                padding: 10px 20px;
            }

            nav {
                padding: 8px 20px;
            }

            .main-content {
                padding: 25px 15px;
            }

            .main-content h1 {
                font-size: 22px;
            }

            .table-controls {
                flex-direction: column;
                gap: 15px;
            }

            .search-bar {
                width: 100%;
            }

            .table-container {
                margin: 0 10px;
            }

            table {
                font-size: 13px;
            }

            th, td {
                padding: 8px 10px;
            }

            .action-btn, .add-book-link {
                padding: 6px 12px;
                font-size: 13px;
            }

            footer {
                padding: 12px 20px;
            }
        }

        @media (max-width: 480px) {
            .logo {
                font-size: 22px;
            }

            .main-content h1 {
                font-size: 20px;
                margin-bottom: 15px;
            }

            table {
                font-size: 12px;
            }

            th, td {
                padding: 6px 8px;
            }

            .action-btn, .add-book-link {
                padding: 5px 10px;
                font-size: 12px;
            }

            .action-btn i, .add-book-link i {
                font-size: 12px;
            }

            .search-bar {
                padding: 6px 10px;
            }

            footer {
                font-size: 12px;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <i class="fa-solid fa-book-open-reader"></i>
            Take n' Read
        </div>
    </header>

    <nav>
        <a href="home.jsp"><i class="fas fa-home"></i> Home</a>
    </nav>

    <div class="main-content">
        <h1>All Books</h1>
        <div class="table-controls">
            <div class="search-bar">
                <i class="fas fa-search"></i>
                <input type="text" id="searchInput" placeholder="Search books by title...">
            </div>
            <a href="addbook.jsp" class="add-book-link">
                <i class="fas fa-plus"></i> Add Book
            </a>
        </div>
        <div class="table-container">
            <table id="bookTable">
                <thead>
                    <tr>
                        <th style="width: 10%;">Book ID</th>
                        <th class="title" style="width: 25%;">Title</th>
                        <th class="author" style="width: 20%;">Author</th>
                        <th style="width: 15%;">Price</th>
                        <th style="width: 15%;">Category</th>
                        <th style="width: 10%;">Status</th>
                        <th style="width: 15%;">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td class="title">Muna Madan</td>
                        <td class="author">Laxmi Prasad Devkota</td>
                        <td class="price">250.00</td>
                        <td class="category"><i class="fas fa-scroll"></i> Poetry</td>
                        <td class="status active">Active</td>
                        <td class="action">
                        <a href="editBook.jsp">
                            <button class="action-btn edit"><i class="fas fa-edit"></i> Edit</button></a>
                            <button class="action-btn delete"><i class="fas fa-trash"></i> Delete</button>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td class="title">Shirishko Phool</td>
                        <td class="author">Parijat</td>
                        <td class="price">350.00</td>
                        <td class="category"><i class="fas fa-book"></i> Fiction</td>
                        <td class="status active">Active</td>
                        <td class="action">
                            <button class="action-btn edit"><i class="fas fa-edit"></i> Edit</button>
                            <button class="action-btn delete"><i class="fas fa-trash"></i> Delete</button>
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td class="title">Seto Bagh</td>
                        <td class="author">Diamond Shumsher Rana</td>
                        <td class="price">400.00</td>
                        <td class="category"><i class="fas fa-landmark"></i> History</td>
                        <td class="status inactive">Inactive</td>
                        <td class="action">
                            <button class="action-btn edit"><i class="fas fa-edit"></i> Edit</button>
                            <button class="action-btn delete"><i class="fas fa-trash"></i> Delete</button>
                        </td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td class="title">Jhola</td>
                        <td class="author">Krishna Dharabasi</td>
                        <td class="price">300.00</td>
                        <td class="category"><i class="fas fa-book"></i> Fiction</td>
                        <td class="status active">Active</td>
                        <td class="action">
                            <button class="action-btn edit"><i class="fas fa-edit"></i> Edit</button>
                            <button class="action-btn delete"><i class="fas fa-trash"></i> Delete</button>
                        </td>
                    </tr>
                    <tr class="no-books">
                        <td colspan="7">No Books Found</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <footer>
        © 2025 Take n' Read. All rights reserved.
    </footer>

    <script>
        document.getElementById('searchInput').addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            const rows = document.querySelectorAll('#bookTable tbody tr:not(.no-books)');
            const noBooksRow = document.querySelector('#bookTable .no-books');
            let visibleRows = 0;

            rows.forEach(row => {
                const title = row.querySelector('.title').textContent.toLowerCase();
                const isVisible = title.includes(searchTerm);
                row.style.display = isVisible ? '' : 'none';
                if (isVisible) visibleRows++;
            });

            noBooksRow.classList.toggle('show', visibleRows === 0);
        });
    </script>
</body>
</html>
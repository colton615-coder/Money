<!-- index.html (Dashboard) -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Budget Tracker - Dashboard</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/PapaParse/5.4.1/papaparse.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.2/jspdf.umd.min.js"></script>
  <link rel="stylesheet" href="style.css">
</head>
<body class="bg-gray-100 text-gray-900">
  <div class="p-6 pb-20">
    <h1 class="text-2xl font-bold mb-4">Dashboard</h1>
    <div id="dashboard" class="bg-white shadow rounded p-4 mb-4"></div>
  </div>

  <nav class="fixed bottom-0 w-full bg-white shadow-md flex justify-around p-3">
    <a href="index.html">Dashboard</a>
    <a href="expenses.html">Expenses</a>
    <a href="budgets.html">Budgets</a>
    <a href="reports.html">Reports</a>
    <a href="calendar.html">Calendar</a>
  </nav>

  <script src="script.js"></script>
  <script>
    renderDashboard();
  </script>
</body>
</html><!-- expenses.html -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Expenses</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="style.css">
</head>
<body class="bg-gray-100 text-gray-900">
  <div class="p-6 pb-20">
    <h1 class="text-2xl font-bold mb-4">Expenses</h1>
    <div class="bg-white shadow rounded p-4 mb-4">
      <input id="desc" class="border p-2 mr-2" placeholder="Description">
      <input id="amount" type="number" class="border p-2 mr-2" placeholder="Amount">
      <select id="category" class="border p-2 mr-2">
        <option>General</option>
        <option>Food</option>
        <option>Bills</option>
        <option>Travel</option>
      </select>
      <button onclick="addExpense()" class="bg-blue-500 text-white px-4 py-2 rounded">Add</button>
    </div>
    <ul id="expenseList"></ul>
  </div>

  <nav class="fixed bottom-0 w-full bg-white shadow-md flex justify-around p-3">
    <a href="index.html">Dashboard</a>
    <a href="expenses.html">Expenses</a>
    <a href="budgets.html">Budgets</a>
    <a href="reports.html">Reports</a>
    <a href="calendar.html">Calendar</a>
  </nav>

  <script src="script.js"></script>
  <script>renderExpenses();</script>
</body>
</html><!-- budgets.html -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Budgets</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="style.css">
</head>
<body class="bg-gray-100 text-gray-900">
  <div class="p-6 pb-20">
    <h1 class="text-2xl font-bold mb-4">Budgets</h1>
    <div class="bg-white shadow rounded p-4 mb-4">
      <input id="bname" class="border p-2 mr-2" placeholder="Budget Name">
      <input id="blimit" type="number" class="border p-2 mr-2" placeholder="Limit">
      <button onclick="addBudget()" class="bg-green-500 text-white px-4 py-2 rounded">Add</button>
    </div>
    <ul id="budgetList"></ul>
  </div>

  <nav class="fixed bottom-0 w-full bg-white shadow-md flex justify-around p-3">
    <a href="index.html">Dashboard</a>
    <a href="expenses.html">Expenses</a>
    <a href="budgets.html">Budgets</a>
    <a href="reports.html">Reports</a>
    <a href="calendar.html">Calendar</a>
  </nav>

  <script src="script.js"></script>
  <script>renderBudgets();</script>
</body>
</html><!-- reports.html -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reports</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <link rel="stylesheet" href="style.css">
</head>
<body class="bg-gray-100 text-gray-900">
  <div class="p-6 pb-20">
    <h1 class="text-2xl font-bold mb-4">Reports</h1>
    <canvas id="pieChart" class="mb-4"></canvas>
    <div class="flex space-x-4">
      <button onclick="exportCSV()" class="bg-blue-500 text-white px-4 py-2 rounded">Export CSV</button>
      <button onclick="exportPDF()" class="bg-red-500 text-white px-4 py-2 rounded">Export PDF</button>
    </div>
  </div>

  <nav class="fixed bottom-0 w-full bg-white shadow-md flex justify-around p-3">
    <a href="index.html">Dashboard</a>
    <a href="expenses.html">Expenses</a>
    <a href="budgets.html">Budgets</a>
    <a href="reports.html">Reports</a>
    <a href="calendar.html">Calendar</a>
  </nav>

  <script src="script.js"></script>
  <script>renderReports();</script>
</body>
</html><!-- calendar.html -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Calendar</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="style.css">
</head>
<body class="bg-gray-100 text-gray-900">
  <div class="p-6 pb-20">
    <h1 class="text-2xl font-bold mb-4">Calendar</h1>
    <ul id="calendarList"></ul>
  </div>

  <nav class="fixed bottom-0 w-full bg-white shadow-md flex justify-around p-3">
    <a href="index.html">Dashboard</a>
    <a href="expenses.html">Expenses</a>
    <a href="budgets.html">Budgets</a>
    <a href="reports.html">Reports</a>
    <a href="calendar.html">Calendar</a>
  </nav>

  <script src="script.js"></script>
  <script>renderCalendar();</script>
</body>
</html>/* script.js – shared logic */
function getData(key) {
  return JSON.parse(localStorage.getItem(key) || "[]");
}
function saveData(key, data) {
  localStorage.setItem(key, JSON.stringify(data));
}

// Dashboard
function renderDashboard() {
  const expenses = getData("expenses");
  const budgets = getData("budgets");
  const spent = expenses.reduce((s, e) => s + e.amount, 0);
  const total = budgets.reduce((s, b) => s + b.limit, 0);
  document.getElementById("dashboard").innerHTML = `
    <p>Total Budget: $${total}</p>
    <p>Total Spent: $${spent}</p>
    <p>Remaining: $${total - spent}</p>`;
}

// Expenses
function addExpense() {
  const desc = document.getElementById("desc").value;
  const amount = parseFloat(document.getElementById("amount").value);
  const category = document.getElementById("category").value;
  if (!desc || !amount) return;
  const expenses = getData("expenses");
  expenses.push({ id: Date.now(), desc, amount, category });
  saveData("expenses", expenses);
  renderExpenses();
}
function renderExpenses() {
  const expenses = getData("expenses");
  document.getElementById("expenseList").innerHTML =
    expenses.map(e => `<li>${e.desc} - $${e.amount} [${e.category}]</li>`).join("");
}

// Budgets
function addBudget() {
  const name = document.getElementById("bname").value;
  const limit = parseFloat(document.getElementById("blimit").value);
  if (!name || !limit) return;
  const budgets = getData("budgets");
  budgets.push({ id: Date.now(), name, limit });
  saveData("budgets", budgets);
  renderBudgets();
}
function renderBudgets() {
  const budgets = getData("budgets");
  document.getElementById("budgetList").innerHTML =
    budgets.map(b => `<li>${b.name} - $${b.limit}</li>`).join("");
}

// Reports
function renderReports() {
  const expenses = getData("expenses");
  const byCat = {};
  expenses.forEach(e => byCat[e.category] = (byCat[e.category] || 0) + e.amount);

  new Chart(document.getElementById("pieChart"), {
    type: "pie",
    data: { labels: Object.keys(byCat), datasets: [{ data: Object.values(byCat) }] }
  });
}
function exportCSV() {
  const expenses = getData("expenses");
  const csv = Papa.unparse(expenses);
  const blob = new Blob([csv], { type: "text/csv;charset=utf-8;" });
  const link = document.createElement("a");
  link.href = URL.createObjectURL(blob);
  link.download = "report.csv";
  link.click();
}
function exportPDF() {
  const { jsPDF } = window.jspdf;
  const doc = new jsPDF();
  doc.text("Expense Report", 20, 20);
  let y = 40;
  getData("expenses").forEach(e => { doc.text(`${e.desc} - $${e.amount}`, 20, y); y += 10; });
  doc.save("report.pdf");
}

// Calendar
function renderCalendar() {
  const expenses = getData("expenses");
  document.getElementById("calendarList").innerHTML =
    expenses.map(e => `<li>${new Date(e.id).toLocaleDateString()} - ${e.desc} - $${e.amount}</li>`).join("");
}/* style.css (optional overrides) */
body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; }
nav a { color: #333; font-weight: 500; }

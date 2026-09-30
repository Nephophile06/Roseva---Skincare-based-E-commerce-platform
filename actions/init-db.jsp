<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page
        import="java.sql.Connection,java.sql.Statement,java.io.InputStream,java.io.BufferedReader,java.io.InputStreamReader,java.util.ArrayList,java.util.List,com.roseva.util.DBConnectionUtil"
        %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>Database Setup - Roséva</title>
            <style>
                body {
                    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
                    padding: 40px;
                    background: #FFFAF0;
                    color: #4A1E2D;
                }

                .box {
                    background: white;
                    padding: 30px;
                    border-radius: 12px;
                    border: 1px solid #e0d0d5;
                    max-width: 650px;
                    margin: auto;
                    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
                }

                h2 {
                    margin-top: 0;
                    color: #7A2E47;
                }

                .success {
                    color: #2e7d32;
                    font-weight: bold;
                }

                .error {
                    color: #c62828;
                    font-weight: bold;
                }

                .logs {
                    background: #fbf7f8;
                    border: 1px solid #ebd8dc;
                    border-radius: 8px;
                    padding: 12px 16px;
                    max-height: 250px;
                    overflow-y: auto;
                    font-family: monospace;
                    font-size: 13px;
                    margin: 15px 0;
                    color: #333;
                }

                .logs p {
                    margin: 4px 0;
                }

                .btn {
                    display: inline-block;
                    margin-top: 15px;
                    padding: 12px 24px;
                    background: #7A2E47;
                    color: white;
                    text-decoration: none;
                    border-radius: 6px;
                    font-weight: 500;
                }

                .btn:hover {
                    background: #5e2336;
                }
            </style>
        </head>

        <body>
            <div class="box">
                <h2>Roséva Database Table Setup</h2>
                <% String resultMessage="" ; boolean ok=true; List<String> executionLogs = new ArrayList<String>();
                        int executedCount = 0;

                        try (Connection conn = DBConnectionUtil.getConnection();
                        Statement st = conn.createStatement()) {

                        InputStream is = application.getResourceAsStream("/WEB-INF/schema.sql");
                        if (is != null) {
                        BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
                        StringBuilder sb = new StringBuilder();
                        String line;

                        while ((line = br.readLine()) != null) {
                        line = line.trim();
                        if (line.startsWith("--") || line.isEmpty()) {
                        continue;
                        }
                        sb.append(line).append(" ");
                        if (line.endsWith(";")) {
                        String sql = sb.toString().trim();
                        if (sql.endsWith(";")) {
                        sql = sql.substring(0, sql.length() - 1).trim();
                        }
                        sb.setLength(0);

                        if (!sql.isEmpty() && !sql.equalsIgnoreCase("COMMIT")) {
                        try {
                        st.execute(sql);
                        executedCount++;
                        String snippet = sql.length() > 50 ? sql.substring(0, 50) + "..." : sql;
                        executionLogs.add("✔ " + snippet);
                        } catch (Exception ex) {
                        // e.g. table already exists or row already exists
                        executionLogs.add("ℹ " + ex.getMessage());
                        }
                        }
                        }
                        }

                        try {
                        if (!conn.getAutoCommit()) {
                        conn.commit();
                        }
                        } catch (Exception ignored) {}

                        resultMessage = "Database setup completed successfully!";
                        } else {
                        ok = false;
                        resultMessage = "Error: schema.sql not found";
                        }
                        } catch (Exception e) {
                        ok = false;
                        resultMessage = "Database Error: " + e.getMessage();
                        }
                        %>

                        <p class="<%= ok ? " success" : "error" %>"><%= resultMessage %>
                        </p>

                        <% if (!executionLogs.isEmpty()) { %>
                            <div class="logs">
                                <% for (String log : executionLogs) { %>
                                    <p>
                                        <%= log %>
                                    </p>
                                    <% } %>
                            </div>
                            <% } %>

                                <a href="../index.jsp" class="btn">Go to Home Page &rarr;</a>
            </div>
        </body>

        </html>
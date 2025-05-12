

    // Function to calculate BMI
	function calculateBMI() {
	    var weight = parseFloat(document.getElementById("uweight").value); // Get weight in kg
	    var height = parseFloat(document.getElementById("uheight").value); // Get height in cm

	    // Convert height to meters
	    height = height / 100; // Convert height from cm to meters

	    // Calculate BMI if both values are valid
	    if (weight > 0 && height > 0) {
	        var bmi = weight / (height * height); // BMI formula
	        document.getElementById("ubmi").value = bmi.toFixed(2); // Display BMI with 2 decimal places
	    } else {
	        document.getElementById("ubmi").value = ""; // Clear BMI field if input is invalid
	    }
	}
	// Function to toggle the custom goal input field
	function toggleCustomGoal() {
	    var goalSelect = document.getElementById("goal");
	    var customGoalInput = document.getElementById("customGoal");
	    if (goalSelect.value === "Other") {
	        customGoalInput.style.display = "inline"; // Show the custom input
	    } else {
	        customGoalInput.style.display = "none"; // Hide the custom input
	    }
	}
	// Function to calculate age based on the date of birth
	        function calculateAge() {
	            const dob = document.getElementById("udob").value;
	            const dobDate = new Date(dob);
	            const currentDate = new Date();
	            const age = currentDate.getFullYear() - dobDate.getFullYear();
	            const monthDifference = currentDate.getMonth() - dobDate.getMonth();
	            
	            // If the birthday hasn't occurred yet this year, subtract 1 from age
	            if (monthDifference < 0 || (monthDifference === 0 && currentDate.getDate() < dobDate.getDate())) {
	                age--;
	            }
	            
	            document.getElementById("uage").value = age;
	        }
//viewfoodtracking
// Function to search the table based on User ID or Created At
        function searchTable() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById('searchInput');
            filter = input.value.toUpperCase();
            table = document.getElementById('foodTrackingTable');
            tr = table.getElementsByTagName('tr');
            
            for (i = 1; i < tr.length; i++) {
                td = tr[i].getElementsByTagName('td');
                if (td) {
                    var userId = td[1].textContent || td[1].innerText;
                    var createdAt = td[7].textContent || td[7].innerText;
                    if (userId.toUpperCase().indexOf(filter) > -1 || createdAt.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }

        // Function to sort the table by the Created At column (Date)
        function sortTable() {
            var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
            table = document.getElementById("foodTrackingTable");
            switching = true;
            dir = "asc"; // Set the sorting direction to ascending initially
            while (switching) {
                switching = false;
                rows = table.rows;
                for (i = 1; i < (rows.length - 1); i++) {
                    shouldSwitch = false;
                    x = rows[i].getElementsByTagName("TD")[7]; // Get the Created At column
                    y = rows[i + 1].getElementsByTagName("TD")[7];
                    if (dir == "asc") {
                        if (new Date(x.innerHTML) > new Date(y.innerHTML)) {
                            shouldSwitch = true;
                            break;
                        }
                    } else if (dir == "desc") {
                        if (new Date(x.innerHTML) < new Date(y.innerHTML)) {
                            shouldSwitch = true;
                            break;
                        }
                    }
                }
                if (shouldSwitch) {
                    rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                    switching = true;
                    switchcount++;
                } else {
                    if (switchcount == 0 && dir == "asc") {
                        dir = "desc";
                        switching = true;
                    }
                }
            }
        }

        // Function to export the table data to CSV
        function exportToCSV() {
            var table = document.getElementById("foodTrackingTable");
            var rows = table.rows;
            var csv = [];
            for (var i = 0; i < rows.length; i++) {
                var row = rows[i];
                var cells = row.getElementsByTagName("td");
                var rowData = [];
                for (var j = 0; j < cells.length - 1; j++) { // Exclude the last column (Actions)
                    rowData.push(cells[j].innerText);
                }
                csv.push(rowData.join(","));
            }
            var csvContent = "data:text/csv;charset=utf-8," + csv.join("\n");
            var encodedUri = encodeURI(csvContent);
            var link = document.createElement("a");
            link.setAttribute("href", encodedUri);
            link.setAttribute("download", "food_tracking.csv");
            document.body.appendChild(link);
            link.click();
        }

        // Placeholder functions for Edit and Delete actions
        function editTracking(id) {
            alert("Edit tracking record with ID: " + id);
            // Redirect to the edit page or open an edit form
        }

        function deleteTracking(id) {
            alert("Delete tracking record with ID: " + id);
            // Add functionality to delete the record
        }

		// Display message after form submission
		        function displayMessage(message) {
		            var msgBox = document.getElementById("message");
		            msgBox.textContent = message;
		            msgBox.style.display = "block";
		            setTimeout(function() {
		                msgBox.style.display = "none";
		            }, 3000);
		        }

		        // Form Validation function
		        function validateForm() {
		            var date = document.getElementById("date").value;
		            if (!date) {
		                alert("Please select a valid date.");
		                return false;
		            }
		            // Add more validation if needed
		            return true;
					}
					// Sort Table by Date
					function sortTable() {
					    var table = document.getElementById("foodTrackingTable");
					    var rows = Array.from(table.rows).slice(1); // Get all rows except the header
					    rows.sort((a, b) => {
					        var dateA = new Date(a.cells[7].textContent); // Created At column
					        var dateB = new Date(b.cells[7].textContent);
					        return dateB - dateA; // Sort in descending order
					    });
					    rows.forEach(row => table.appendChild(row)); // Re-append sorted rows
					}

					// Search Functionality
					function searchTable() {
					    var input = document.getElementById("searchInput");
					    var filter = input.value.toLowerCase();
					    var table = document.getElementById("foodTrackingTable");
					    var rows = table.getElementsByTagName("tr");

					    for (var i = 1; i < rows.length; i++) {
					        var cells = rows[i].getElementsByTagName("td");
					        var userId = cells[1].textContent.toLowerCase();
					        var createdAt = cells[7].textContent.toLowerCase();
					        if (userId.indexOf(filter) > -1 || createdAt.indexOf(filter) > -1) {
					            rows[i].style.display = "";
					        } else {
					            rows[i].style.display = "none";
					        }
					    }
					}

					// Export to CSV Function
					function exportToCSV() {
					    var table = document.getElementById("foodTrackingTable");
					    var rows = table.rows;
					    var csv = [];
					    for (var i = 0; i < rows.length; i++) {
					        var row = rows[i];
					        var rowData = [];
					        for (var j = 0; j < row.cells.length; j++) {
					            rowData.push(row.cells[j].textContent);
					        }
					        csv.push(rowData.join(","));
					    }

					    var csvString = csv.join("\n");
					    var link = document.createElement("a");
					    link.setAttribute("href", "data:text/csv;charset=utf-8," + encodeURIComponent(csvString));
					    link.setAttribute("download", "food_tracking.csv");
					    document.body.appendChild(link);
					    link.click();
					    document.body.removeChild(link);
					}

					// Delete Tracking Function (with confirmation)
					function deleteTracking(id) {
					    var confirmDelete = confirm("Are you sure you want to delete this entry?");
					    if (confirmDelete) {
					        alert("Delete tracking with ID: " + id);
					    }
					}
					function goToHomePage() {
					       window.location.href = 'http://localhost:2090/foodtracking';
						   }
// Join button functionality
document.getElementById('joinBtn').addEventListener('click', function() {
    const code = document.getElementById('joinCode').value;
    const feedback = document.getElementById('loginFeedback');
    if (code) {
        feedback.style.color = 'green';
        feedback.textContent = `Joining quiz with code: ${code}`;
        // Redirect or load the quiz based on the entered code
    } else {
        feedback.style.color = 'red';
        feedback.textContent = 'Please enter a valid code.';
    }
});

// Login form functionality
document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault();
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;
    const feedback = document.getElementById('loginFeedback');
    
    if (username === '' || password === '') {
        feedback.style.color = 'red';
        feedback.textContent = 'Username and password cannot be empty!';
    } else {
        feedback.style.color = 'green';
        feedback.textContent = `Logged in successfully as ${username}`;
        // Add your login logic here
    }
});

// Signup form functionality
document.getElementById('signupForm').addEventListener('submit', function(event) {
    event.preventDefault();
    const newUsername = document.getElementById('newUsername').value;
    const newPassword = document.getElementById('newPassword').value;
    const feedback = document.getElementById('signupFeedback');
    
    if (newUsername === '' || newPassword === '') {
        feedback.style.color = 'red';
        feedback.textContent = 'Please fill in all fields.';
    } else if (newPassword.length < 8) {
        feedback.style.color = 'red';
        feedback.textContent = 'Password must be at least 8 characters.';
    } else {
        feedback.style.color = 'green';
        feedback.textContent = `Signup successful for ${newUsername}`;
        // Add your signup logic here
    }
});

// Toggle between login and signup forms
document.getElementById('loginToggle').addEventListener('click', function() {
    document.getElementById('loginForm').style.display = 'block';
    document.getElementById('signupForm').style.display = 'none';
});

document.getElementById('signupToggle').addEventListener('click', function() {
    document.getElementById('signupForm').style.display = 'block';
    document.getElementById('loginForm').style.display = 'none';
});

// Clear feedback when focusing on input
function clearFeedback() {
    document.getElementById('loginFeedback').textContent = '';
    document.getElementById('signupFeedback').textContent = '';
}

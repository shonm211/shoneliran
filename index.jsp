
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>ARR</title>
  <style>
    html,
    body {
      height: 100%;
      background: #fafafa;
      font-family: Arial, Helvetica, sans-serif;
    }

    #container {
      height: 100%;
      width: 100%;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    #login-form {
      padding: 10px;
      border-radius: 10px;
      background: #e9ecef;
    }

    .form .input {
      margin: 5px;
      display: flex;
      justify-content: center;

    }

    .form input {
      border: none;
      border-radius: 5px;
      padding: 5px;
      outline: none;
      line-height: 1.5;
    }

    #messages {
      display: flex;
      flex-direction: column;
    }

    #messages .message,
    .validation {
      padding: 5px;
    }

    #messages .message.success {
      color: #28a745;
    }

    #messages .message.error,
    .validation.error {
      color: #dc3545;
    }
  </style>

</head>

<body>
  <div id="container">
    <!-- //purge no_login_form -->
    <div id="login-form">
      <div class="form">
        <div class="input">
          <input type="email" id="email-input" placeholder="e-mail" />
        </div>

        <div class="input">
          <input type="password" id="password-input" placeholder="password" />
        </div>

        <div class="input">
          <div>
            <button id="login-button">Login</Button>
          </div>
        </div>
      </div>

      <div id="messages">
      </div>
    </div>
    <!-- //endpurge no_login_form -->
  </div>

  <!-- //purge no_login_form -->
  <script>
    const validCredentials = {
      email: 'login@codility.com',
      password: 'password',
    }

    const container = document.getElementById('container');
    const messages = document.getElementById('messages');
    const loginButton = document.getElementById('login-button');
    const emailInput = document.getElementById('email-input');
    const passwordInput = document.getElementById('password-input');

    const emailValidationRegexp = /^[\w\.]+@\w+\..{2,3}(.{2,3})?$/;

    const addMessage = (type, text) => {
      const div = document.createElement('div');
      div.classList.add(...type.split('.'));
      div.textContent = text;

      messages.appendChild(div);
    };

    const clearMessages = () => {
      while (messages.hasChildNodes()) {
        messages.removeChild(messages.lastChild);
      }
    }

    const getCredentials = () => ({
      email: emailInput.value,
      password: passwordInput.value
    });

    const createSuccessPageElement = () => {
      const successMessage = document.createElement('div');
      successMessage.classList.add('message', 'success');
      successMessage.textContent = 'Welcome to Codility';
      return successMessage;
    }

    const redirectToSuccessPage = () => {
      //purge success_redirect_not_working
      while (container.hasChildNodes()) {
        container.removeChild(container.lastChild);
      }

      const successMessage = createSuccessPageElement();
      container.appendChild(successMessage);
      //endpurge success_redirect_not_working
    }

    //purge empty_fields_passing
    const validateEmail = email => {
      if (email === '') {
        addMessage('validation.error', 'Email is required');
        return false;
      }
      //purge all_emails_are_valid
      else if (!emailValidationRegexp.test(email)) {
        addMessage('validation.error', 'Enter a valid email');
        return false;
      }
      //endpurge all_emails_are_valid
      return true;
    }

    const validatePassword = password => {
      if (password === '') {
        addMessage('validation.error', 'Password is required');
        return false;
      }
      return true;
    }
    //endpurge empty_fields_passing

    const handleLogin = () => {
      clearMessages();

      const { email, password } = getCredentials();

      //purge empty_fields_passing
      const validationFailed = [
        //purge missing_email_validation
        validateEmail(email),
        //endpurge missing_email_validation
        validatePassword(password)
      ].some(validationResult => validationResult === false);

      if (validationFailed) {
        return;
      }
      //endpurge empty_fields_passing

      if (validCredentials.password === password && validCredentials.email === email) {
        redirectToSuccessPage();
      } else {
        //purge invalid_credentials_not_working
        addMessage('message.error', 'You shall not pass! Arr!');
        //endpurge invalid_credentials_not_working
      }
    }

    loginButton.addEventListener('click', handleLogin);
  </script>
  <!-- //endpurge no_login_form -->
</body>
</html>

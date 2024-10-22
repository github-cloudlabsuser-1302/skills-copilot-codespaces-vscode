let display = document.getElementById('display');
let currentInput = '';
let operator = '';
let previousInput = '';

function clearDisplay() {
    currentInput = '';
    operator = '';
    previousInput = '';
    display.innerText = '0';
}

function appendToDisplay(value) {
    if (currentInput === '' && value === '0') return;
    currentInput += value;
    display.innerText = currentInput;
}

function calculateResult() {
    if (previousInput === '' || currentInput === '' || operator === '') return;
    let result;
    const prev = parseFloat(previousInput);
    const current = parseFloat(currentInput);

    switch (operator) {
        case '+':
            result = prev + current;
            break;
        case '-':
            result = prev - current;
            break;
        case '*':
            result = prev * current;
            break;
        case '/':
            result = prev / current;
            break;
        default:
            return;
    }

    display.innerText = result;
    currentInput = result.toString();
    operator = '';
    previousInput = '';
}

function setOperator(op) {
    if (currentInput === '') return;
    if (previousInput !== '') {
        calculateResult();
    }
    operator = op;
    previousInput = currentInput;
    currentInput = '';
}
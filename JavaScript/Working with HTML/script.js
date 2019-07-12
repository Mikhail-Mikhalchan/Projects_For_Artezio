alert("It works!")

//Первый этап
/*function buttonClick()
{
    var x1 = document.getElementById('x1').value;
    var x2 = document.getElementById('x2').value;
    var resultDiv = document.getElementById('result');
    resultDiv.append("x1: " + x1 + ", x2: " + x2);
}*/
//Вторый этап
/*function buttonClick()
{
    var x1 = parseInt(document.getElementById('x1').value);
    var x2 = parseInt(document.getElementById('x2').value);
    var resultDiv = document.getElementById('result');
    resultDiv.append("x1 + x2: " + (x1 + x2));
}
*/
//Третий этап
/*function buttonClick()
{
    var x1 = parseInt(document.getElementById('x1').value);
    var x2 = parseInt(document.getElementById('x2').value);
    
    if(Number.isNaN(x1) || Number.isNaN(x2))
    {
        alert("В поля х1 и х2 должны быть введены числовые значения.");    
    }
    else
    {
        var resultDiv = document.getElementById('result');
        resultDiv.append("x1 + x2: " + (x1 + x2));  
    }  
}*/

/*-------------------------------------
Задания для самостоятельного выполнения
-------------------------------------*/

function buttonRun()
{
    var inputX1 = document.getElementById('x1');
    var inputX2 = document.getElementById('x2');
    
    let x1 = parseInt(inputX1.value);
    let x2 = parseInt(inputX2.value);
    
    var resultDiv = document.getElementById('result');
    
    if(inputX1.value === '' || inputX2.value === '') //Проверка на пустые поля
    {
        alert("Поля х1 и х2 должны быть заполнены.");    
    }
    else if(Number.isNaN(x1) || Number.isNaN(x2))
    {
        alert("В поля х1 и х2 должны быть введены числовые значения.");    
    }
    else
    {
        if (document.querySelector('input[name="choice"]:checked').value === "sum") 
        {
            resultDiv.innerHTML = ''; //Прошлый результат очищается
            resultDiv.append("Cумма всех чисел от x1 до x2: " + sum(x1, x2));   
        }
        else if (document.querySelector('input[name="choice"]:checked').value === "multi") 
        {
            resultDiv.innerHTML = ''; //Прошлый результат очищается
            resultDiv.append("Произведение всех чисел от x1 до x2: " + mult(x1, x2)); 
        }
        else if (document.querySelector('input[name="choice"]:checked').value === "prime") 
        {
            resultDiv.innerHTML = ''; //Прошлый результат очищается
            resultDiv.append("Простые числа в промежутке от x1 до x2: " + searchPrimeNumbers(x1, x2)); 
        }
    }
}

function sum(a, b) //Cумма всех чисел от x1 до x2
{
    let s = 0, x1 = a, x2 = b;
    for(let i = x1; i <= x2; i++)
    {
        s += i;
    }
    return s;
}

function mult(a, b) //Произведение всех чисел от x1 до x2
{
    let m = 1, x1 = a, x2 = b;
    for(let i = x1; i <= x2; i++)
    {
        m *= i;
    }
    return m;
}

function searchPrimeNumbers(a, b) //Простые числа в промежутке от x1 до x2
{
    let x1 = a, x2 = b, arr = [], flag = false, c = 0;
    for(let i = x1; i <= x2; i++)
    {
        for(let j = i - 1; j > 1; j--)
        {
            c = i % j;
            if (c === 0)
            {
                flag = true;
                break;
            }
            else if (c != 0)
            {
                flag = false;
            }
        }
        if (!flag)
        {
            arr[arr.length] = i;            
        }
    }
    return arr;
}

function buttonClear() //Кнопка 'Очистить'
{
    document.getElementById('x1').value = "";
    document.getElementById('x2').value = "";
}
/*Кнопка перейти*/
$('#btnStart').click(function () {
    hideStartBlock();   
});

/*Кнопка закрыть на блоке победы*/
$('#btnWinClose').click(function () {
    visibilityWinBlock();   
});

/*Кнопка закрыть на блоке поражения*/
$('#btnLoseClose').click(function () {
    visibilityLoseBlock();   
});

/*Кнопка Начать игру/Завершить игру*/
$('#startGame').click(function () {
   startGame();   
});

$('#finishGame').click(function () {
   finishGame();   
});

/*Функция начала игры*/
function startGame() {
  changeButtons();
  shuffle();
  cards.forEach(card => card.addEventListener('click', flipCard));
  resetBoard();
  countdown();  
}

/*Функция окончания игры*/
function finishGame() {
    stopperTime();
    lockBoard = true;
    cards.forEach(card => {
            card.classList.remove('flip');
        });
    pair = 0;
    flips = 0;
    counter();
    timeleft = 180;
    document.getElementById("countdown").innerHTML = timeleft;
    changeButtons();
}

/*Счетчик открытых пар*/
var pair = 0;

/*Счетчик флипов*/
var flips = 0;
function counter(){
    var counterElement = document.getElementById("flCount");
    var counterNumber = parseInt(counterElement.innerHTML);
    counterNumber = flips;
    counterElement.innerHTML = counterNumber;
  }

/*Функция смены кнопок*/
function changeButtons() {
    var btnFinish = document.getElementById('finishGame');
    if(btnFinish.style.visibility != 'visible')
    {
        btnFinish.style.visibility = 'visible';
    }   
    else
    {
        btnFinish.style.visibility = 'hidden';
    }    
}

/*Функция сокрытия стартовых блоков*/
function hideStartBlock() {
    var overlayBlock = document.getElementById('overlayBlock');
    var startBlock = document.getElementById('startBlock');
    
    overlayBlock.style.visibility = 'hidden';
    startBlock.style.visibility = 'hidden';  
}

/*Функция видимости блока победы*/
function visibilityWinBlock() {
    var overlayBlock = document.getElementById('overlayBlock');
    var winBlock = document.getElementById('winBlock');
    
    if(winBlock.style.visibility != 'visible')
    {
        overlayBlock.style.visibility = 'visible';
        winBlock.style.visibility = 'visible';
    }   
    else
    {
        overlayBlock.style.visibility = 'hidden';
        winBlock.style.visibility = 'hidden';
    }    
}

/*Функция видимости блока поражения*/
function visibilityLoseBlock() {
    var overlayBlock = document.getElementById('overlayBlock');
    var loseBlock = document.getElementById('loseBlock');
    
    if(loseBlock.style.visibility != 'visible')
    {
        overlayBlock.style.visibility = 'visible';
        loseBlock.style.visibility = 'visible';
    }   
    else
    {
        overlayBlock.style.visibility = 'hidden';
        loseBlock.style.visibility = 'hidden';
    }    
}

/*Таймер*/
var timeleft = 180;
var timer;
document.getElementById("finishGame").addEventListener('click', stopperTime);

function countdown() {	
	timeleft--;
    if (timeleft < 0)
    {
        setTimeout(() => {
        visibilityLoseBlock();
        finishGame();    
      }, 1000);
    }
	else 
    {
		timer = setTimeout(countdown, 1000);
        document.getElementById("countdown").innerHTML = timeleft;
    }
}
/*Остановка таймера*/
function stopperTime() {
    clearTimeout(timer);
}

/*Игровой механизм*/
const cards = document.querySelectorAll('.card');
/*Переменная поворота карты*/
let hasFlippedCard = false;
/*Блокировка поворотов*/
let lockBoard = true;
/*Переменные первой и второй открытых карт*/
let firstCard, secondCard;
/*Метод поворота карт*/
function flipCard() {
  if (lockBoard) return;
  if (this === firstCard) return;

  this.classList.add('flip');

  if (!hasFlippedCard) {
    //первый клик
    hasFlippedCard = true;
    firstCard = this;
    flips++;
    counter(); 
    return;
  }
  //второй клик
  secondCard = this;
  flips++;
  counter();
    
  checkForMatch();
}
/*Проверка на одинаковые обороты*/
function checkForMatch() {
  let isMatch = firstCard.dataset.framework === secondCard.dataset.framework;
  isMatch ? disableCards() : unflipCards();
}
/*Обороты одинаковые*/
function disableCards() {
  firstCard.removeEventListener('click', flipCard);
  secondCard.removeEventListener('click', flipCard);
  pair++;
  /*Конец игры при открытии всех пар*/
  if(pair === 16)
  {
      setTimeout(() => {
        visibilityWinBlock(); 
        document.getElementById("finishFlips").innerHTML = flips;
        document.getElementById("finishTime").innerHTML = (180 - timeleft) + "с";
        finishGame();  
        
      }, 1000); 
  }
  resetBoard();
}
/*Обороты разные*/
function unflipCards() {
  lockBoard = true;

  setTimeout(() => {
    firstCard.classList.remove('flip');
    secondCard.classList.remove('flip');

    resetBoard();
  }, 750);
}
/*Метод сбрасывающий пренадлежность к каким-либо картам*/
function resetBoard() {
  [hasFlippedCard, lockBoard] = [false, false];
  [firstCard, secondCard] = [null, null];
}

/*Механизм перемешивания карточек по методу Фишера-Йетса*/
function shuffle() {
  cards.forEach(card => {
    let randomPos = Math.floor(Math.random() * 32);
    card.style.order = randomPos;
  });
};



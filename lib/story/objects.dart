import '../init.dart';
import '../custom_functions.dart';
// import '../models/game_scene.dart';
import '../models/game_object.dart';
import './scenes.dart';

GameObject ta = GameObject(
  id: 'ta',
  name: 'Транс-Эм',
  description: [
    'Понтиак Транс-Эм 1979 года. Этого зверя я увидел на подъездной дорожке ухоженного таунхауса в городке, название которого уже забыл. Ключи были спрятаны за солнцезащитным козырьком.\nТранс-Эм оказался в неплохом состоянии. Его когда-то подновили: покрасили в карамельный цвет, перетянули кожу сидений, поставили CD-проигрыватель. Но это было давно.',
    () {
      if (currentScene.id == 'road1' ||
          currentScene.id == 'road2' ||
          currentScene.id == 'insideTA') {
        return 'Я окидываю взглядом тесный салон масл-кара, произведённого на закате эры больших моторов. Всего несколько месяцев назад он мог стоить под тридцать тысяч. Теперь — бесплатно.';
      } else {
        return 'Я провожу рукой по горячему металлу масл-кара, произведённого на закате эры больших моторов. Всего несколько месяцев назад он мог стоить под тридцать тысяч. Теперь — бесплатно.';
      }
    },
  ],
  hidden: false,
  states: {
    'drive': true,
  },
  actions: [
    {
      'label': 'Осмотреть',
      'logLabel': 'Осмотреть Транс-Эм',
      'text': () => returnString(
            entry: ta.description,
            listFunction: toTheLast,
          ),
      'acts': () {
        ta.actions[0]['label'] = 'Осмотреть ещё раз';
        ta.counter++;
        if (ta.counter >= 2) {
          ta.actions[0]['label'] = 'Осмотреть';
          radio.hidden = false;
          glovebox.hidden = false;
          seat.hidden = false;
        }
      },
      'flags': () {
        return (currentScene.id != 'gas1');
      },
    },
    {
      'label': 'Остановить',
      'logLabel': 'Остановить машину',
      'text':
          'Я плавно торможу и, подняв облако рыжей пыли, сворачиваю на обочину. Глушу мотор.',
      'acts': () => ta.states['drive'] = false,
      'flags': () {
        return (ta.states['drive'] == true && currentScene.id == 'road2');
      },
    },
    {
      'label': 'Выйти',
      'logLabel': 'Выйти из машины',
      'actsBefore': () {
        currentScene = locationBesideTA;
      },
      'text': () =>
          'Открываю дверь и выбираюсь из машины.\n\n' +
          toTheLast(currentScene.description).text,
      'acts': () {},
      'flags': () {
        return (ta.states['drive'] == false && currentScene.id == 'road2');
      },
    },
    {
      'label': 'Внутрь',
      'logLabel': 'Сесть в машину',
      'actsBefore': () {
        if (currentScene.id == 'besideTA2') {
          currentScene = locationInsideTA;
        }
      },
      'text': () {
        if (bottles.hidden) {
          return 'Я ещё не взял воду.';
        } else if (shine.hidden) {
          return 'Когда я, потянув за ручку двери, оглядываю поверх крыши бесконечную степь, то вижу, как что-то блестит метрах в двадцати от дороги. Хм.';
        } else if (!mj.states['seen']) {
          return 'Нет, я должен посмотреть, что там блестит.';
        } else {
          String _temp;
          if (objects.contains(mj)) {
            _temp =
                'Воду убираю назад, а пакет с травкой кладу на пассажирское сиденье, рядом с урной.';
          } else {
            _temp =
                'Последнюю бутылку воды кладу на пассажирское сиденье, рядом с урной.';
          }
          return 'Распахиваю дверь и, в последний раз оглядевшись, ныряю в обволакивающую духоту Транс-Эма.\n$_temp';
        }
      },
      'acts': () {
        if (!bottles.hidden && shine.hidden) {
          shine.hidden = false;
        }
        if (currentScene.id == 'insideTA' && objects.contains(mj)) {
          removeObject(bottles);
        }
      },
      'flags': () =>
          currentScene.id == 'besideTA' || currentScene.id == 'besideTA2',
    },
    {
      'label': 'Идти к багажнику',
      'logLabel': 'Идти к багажнику',
      'actsBefore': () {
        if (bottles.hidden) {
          currentScene = locationBehindTA;
        }
      },
      'text': () {
        if (bottles.hidden) {
          return 'Ступая по горячему асфальту, подхожу к багажнику.';
        } else {
          return 'Не, воду я уже взял.';
        }
      },
      'acts': () {},
      'flags': () =>
          currentScene.id == 'besideTA' || currentScene.id == 'besideTA2',
    },
    {
      'label': 'Идти к водительской двери',
      'logLabel': 'Идти к водительской двери',
      'actsBefore': () {
        currentScene = locationBesideTA;
      },
      'text': () =>
          'Возвращаюсь к водительской двери.\n\n' +
          toTheLast(currentScene.description).text,
      'acts': () {},
      'flags': () => currentScene.id == 'behindTA',
    },
    {
      'label': 'Ехать дальше',
      'logLabel': 'Ехать дальше',
      'text':
          'Я запускаю двигатель и выезжаю с пыльной обочины на чёрный асфальт. Вдавливаю педаль газа, чтобы встречным потоком воздуха вытянуло весь жар из салона, и расслабленно откидываюсь на спинку сиденья.',
      'acts': () => ta.states['drive'] = true,
      'flags': () {
        return (ta.states['drive'] == false && currentScene.id == 'insideTA');
      },
    },
    {
      'label': 'Осмотреть дорогу',
      'logLabel': 'Осмотреть дорогу',
      'actsBefore': () {
        transition = true;
        currentScene.nextScene = cutsceneMJLeaf;
      },
      'text':
          'Лента шоссе — прямая и чёрная, словно прочерченная исполинским грифелем на исполинской карте. На вершинах далёких гор уже можно различить снег. Где-то там будет перевал, продуваемый всеми ветрами, за которым останется последняя треть пути.\n\nПеред глазами вновь встаёт картина: плоский камень, мотоциклетный бак, пакет травы в нём. Я хмыкаю накатившему воспоминанию.',
      'acts': () {},
      'flags': () {
        return (ta.states['drive'] == true && currentScene.id == 'insideTA');
      },
    },
    {
      'label': 'Ехать на заправку',
      'logLabel': 'Ехать на заправку',
      'actsBefore': () {
        transition = true;
        currentScene.nextScene = sceneStub;
      },
      'text': () {
        if (gasstation.states['seenCosts'] &&
            gasstation.states['seenPumps'] &&
            gasstation.states['seenBuilding']) {
          return 'Похоже, что автозаправка заброшена и нет никаких следов, чтобы здесь кто-то побывал за последние месяцы. Я, удовлетворённый, утапливаю педаль газа и направляю Транс-Эм ко въезду.';
        } else if (gasstation.states['seenCosts'] ||
            gasstation.states['seenPumps'] ||
            gasstation.states['seenBuilding']) {
          return 'Решив, что видел достаточно, я утапливаю педаль газа и направляю Транс-Эм ко въезду.';
        } else {
          return 'Впрочем, что может быть опасного на заброшенной автозаправке посреди пустыни? Я отгоняю параноидальные мысли и утапливаю педаль газа, направляя Транс-Эм ко въезду.';
        }
      },
      'acts': () {},
      'flags': () {
        return (currentScene.id == 'gas1');
      },
    },
  ],
  scenes: [
    'road1',
    'road2',
    'besideTA',
    'behindTA',
    'besideTA2',
    'insideTA',
    'gas1',
  ],
);

GameObject radio = GameObject(
  id: 'radio',
  name: 'проигрыватель',
  description:
      'Это точно не тот оригинальный кассетник с хромированными ручками и кнопками, который когда-то ставили в Транс-Эмы. Плавные формы CD-проигрывателя контрастируют со стилем остального салона.',
  states: {
    'tried': false,
  },
  actions: [
    {
      'label': 'Осмотреть',
      'logLabel': 'Осмотреть проигрыватель',
      'text': () => radio.description,
    },
    {
      'label': 'Включить',
      'logLabel': 'Включить проигрыватель',
      'text':
          'Я уже пытался, но безуспешно. Похоже, в последний раз его включали лет десять назад.',
      'acts': () => radio.states['tried'] = true,
      'flags': () => radio.states['tried'] == false,
    },
  ],
  scenes: ['road1'],
);

GameObject glovebox = GameObject(
  id: 'glovebox',
  name: 'бардачок',
  description:
      'Неприметный прямоугольник под длинной кожаной ручкой на приборной панели.',
  states: {
    'seen': false,
    'open': false,
    'tookCigarette': false,
  },
  actions: [
    {
      'label': 'Осмотреть',
      'logLabel': 'Осмотреть бардачок',
      'text': () =>
          glovebox.description +
          (glovebox.states['open'] == true
              ? ' Внутри, среди проспектов и карт, лежит пачка сигарет.'
              : ''),
      'acts': () => glovebox.states['seen'] = true,
    },
    {
      'label': 'Открыть',
      'logLabel': 'Открыть бардачок',
      'text': () => 'Внутри, среди проспектов и карт, лежит пачка сигарет.',
      'acts': () => glovebox.states['open'] = true,
      'flags': () => glovebox.states['open'] == false,
    },
    {
      'label': 'Взять сигарету',
      'logLabel': 'Взять сигарету',
      'text': () {
        if (glovebox.states['tookCigarette']) {
          return 'Я ещё не докурил предыдущую.';
        } else {
          return (ta.states['drive']
                  ? 'Одной рукой придерживая руль, другой я'
                  : 'Я') +
              ' достаю из пачки сигарету, жму на кнопку прикуривателя и, когда тот выщёлкивает, подношу его к сигарете. Раскалённая спираль спаливает белый кончик и я делаю глубокий вдох.';
        }
      },
      'acts': () {
        if (!glovebox.states['tookCigarette']) {
          glovebox.states['tookCigarette'] = true;
          events['globalEvents'].add(glovebox.daemon['smoking']);
        }
      },
      'flags': () => glovebox.states['open'] == true,
    },
    {
      'label': 'Закрыть',
      'logLabel': 'Закрыть бардачок',
      'text': 'Я, не сводя глаз с дороги, тянусь и захлопываю бардачок.',
      'acts': () => glovebox.states['open'] = false,
      'flags': () => glovebox.states['open'] == true,
    }
  ],
  daemon: {
    'smoking': () {
      glovebox.counter++;
      switch (glovebox.counter) {
        case 3:
          if (ta.states['drive']) {
            return 'Сигаретный дым уносится ветром через опущенное стекло.';
          }
          return null;
        case 5:
          glovebox.states['tookCigarette'] = false;
          glovebox.counter = 0;
          eventsToRemove.add(glovebox.daemon['smoking']);
          switch (currentScene.id) {
            case 'road1':
            case 'road2':
            case 'insideTA':
              return 'Докурив сигарету, я раздавливаю окурок в выдвижной пепельнице под проигрывателем.';
            case 'besideTA':
            case 'behindTA':
              return 'Докурив сигарету, я роняю окурок и раздавливаю его носком ботинка.';
            default:
              return null;
          }
          break;
        default:
          return null;
      }
    },
  },
  scenes: [
    'road1',
    'road2',
    'insideTA',
  ],
);

GameObject seat = GameObject(
  id: 'seat',
  name: 'сидение',
  description:
      'На пассажирском сидении стоит погребальная урна, прижатая ремнём безопасности.',
  actions: [
    {
      'label': 'Осмотреть',
      'logLabel': 'Осмотреть сидение',
      'text': () => seat.description,
      'acts': () {
        urn.hidden = false;
        removeObject(seat);
      },
    },
  ],
  scenes: ['road1'],
);

GameObject urn = GameObject(
  id: 'urn',
  name: 'урна',
  description:
      'Запечатанный металлический сосуд на пассажирском сидении.\nЕё верхняя часть — небольшая пластинка с фамилией, именем и датами.',
  states: {
    'seen': false,
  },
  actions: [
    {
      'label': 'Осмотреть',
      'logLabel': 'Осмотреть урну',
      'text': () => urn.description,
      'acts': () {
        urn.states['seen'] = true;
      },
    },
    {
      'label': 'Коснуться',
      'logLabel': 'Коснуться урны',
      'actsBefore': () {
        transition = true;
      },
      'text':
          'Не глядя, я в тысячный раз провожу пальцами по гладкой пластинке с символами.\n\nКим.\n\n«Потерпи, дружище, осталось уже недалеко — два дня от силы. Я своих обещаний не нарушаю, ты же знаешь».',
      'acts': () {},
      'flags': () => urn.states['seen'] == true,
    },
  ],
  scenes: ['road1'],
);

GameObject trunk = GameObject(
  id: 'trunk',
  name: 'багажник',
  description: () {
    return trunk.states['open'] == false
        ? 'Контур крышки небольшого багажника. На её торце раньше, до покраски, были крупные буквы «TRANS AM».'
        : 'Багажник открыт, внутри — типичный для масл-каров небольшой объём, в котором едва помещаются запаска, рюкзак и куб холодильника.';
  },
  hidden: false,
  states: {
    'open': false,
  },
  actions: [
    {
      'label': 'Осмотреть',
      'logLabel': 'Осмотреть багажник',
      'text': () => trunk.description(),
      'acts': () {},
    },
    {
      'label': 'Открыть',
      'logLabel': 'Открыть багажник',
      'text': () {
        if (bottles.hidden) {
          return 'Стараясь меньше касаться горячего металла, я поднимаю крышку багажника. Там, в тесноте, ютятся запасное колесо, рюкзак и дорожный холодильник.';
        } else {
          return 'Я уже взял воду, в багажнике мне больше ничего не нужно.';
        }
      },
      'acts': () {
        if (bottles.hidden) {
          trunk.states['open'] = true;
        }
      },
      'flags': () => trunk.states['open'] == false,
    },
    {
      'label': 'Взять воду',
      'logLabel': 'Взять воду',
      'text':
          'Я открываю холодильник, вынимаю мгновенно запотевшую бутылку, открываю и с наслаждением пью ледяную воду, потом беру ещё одну прозапас, плотно закрываю холодильник и захлопываю крышку багажника.',
      'acts': () {
        bottles.hidden = false;
        trunk.states['open'] = false;
      },
      'flags': () => trunk.states['open'] == true && bottles.hidden == true,
    },
  ],
  scenes: ['behindTA'],
);

GameObject bottles = GameObject(
  id: 'bottles',
  name: 'пара бутылок воды',
  description:
      'Минеральная вода одного очень пафосного бренда. Её стоимость совсем недавно приближалась к стоимости неплохого вина того же объема.',
  actions: [
    {
      'label': 'Осмотреть',
      'logLabel': 'Осмотреть воду',
      'text': () => bottles.description,
      'acts': () {},
    },
  ],
  scenes: ['behindTA', 'besideTA', 'desert', 'besideTA2', 'insideTA'],
);

GameObject shine = GameObject(
  id: 'shine',
  name: 'Что-то блестящее',
  states: {
    'checked': false,
  },
  actions: [
    {
      'label': 'Проверить',
      'logLabel': 'Проверить, что там блестит',
      'actsBefore': () {
        transition = true;
        currentScene.nextScene = locationDesert;
      },
      'text':
          'Обогнув машину, пересекаю обочину и иду среди жёстких, колючих кустов. Слабый ветер теребит полы растёгнутой рубашки и немного облегчает пребывание под безжалостным солнцем. Попадающиеся под ногами камни плоские и ломкие.',
      'acts': () {},
    },
  ],
  scenes: ['besideTA', 'behindTA'],
);

GameObject tank = GameObject(
  id: 'tank',
  name: 'Бак',
  hidden: false,
  states: {
    'kicked': false,
  },
  actions: [
    {
      'label': 'Поднять',
      'logLabel': 'Поднять бак',
      'text': () =>
          'Я подхожу, ${tank.states['kicked'] == false ? 'встряхиваю бак, убедившись, что внутри что-то есть, ' : 'поднимаю бак, '}с усилием откручиваю крышку и вытягиваю из бака продолговатый пакет, плотно набитый сухими измельчёнными листьями. Мэри Джейн.',
      'acts': () {
        removeObject(tank);
        mj.hidden = false;
      },
    },
    {
      'label': 'Пнуть',
      'logLabel': 'Пнуть бак',
      'text':
          'От удара бак подскакивает и скатывается с валуна. По звуку похоже, что внутри что-то есть.',
      'acts': () {
        tank.states['kicked'] = true;
      },
      'flags': () => tank.states['kicked'] == false,
    },
  ],
  scenes: ['desert'],
);

GameObject mj = GameObject(
  id: 'mj',
  name: 'Пакет',
  states: {
    'seen': false,
  },
  actions: [
    {
      'label': 'Осмотреть',
      'logLabel': 'Осмотреть пакет',
      'text':
          'На пакете приклеена записка: «Койот, ты всегда был придурком и не следил за своим конём, вот он тебя и подвёл. Держи немного дури, чтобы не скучать на том свете. Банда».',
      'acts': () => mj.states['seen'] = true,
    },
    {
      'label': 'Взять себе',
      'logLabel': 'Взять пакет себе',
      'actsBefore': () {
        transition = true;
      },
      'text':
          'Вряд ли тот, кому этот пакет предназначался, когда-нибудь придёт за ним. И я решаю оставить его себе. Закрываю крышку, ставлю бак на валун, и, попивая уже тёплую воду, иду назад, к плывущей в мареве машине.',
      'acts': () {
        bottles.name = 'бутылка воды';
      },
      'flags': () =>
          mj.states['seen'] == true && currentScene == locationDesert,
    },
    {
      'label': 'Сунуть обратно',
      'logLabel': 'Сунуть пакет обратно',
      'actsBefore': () {
        transition = true;
      },
      'text':
          'Чувствуя неловкость от нарушения чьего-то надгробия, я решаю вернуть всё как было. Засовываю пакет обратно, закрываю крышку, ставлю бак на валун, и, попивая уже тёплую воду, иду назад, к плывущей в мареве машине.',
      'acts': () {
        bottles.name = 'бутылка воды';
        removeObject(mj);
      },
      'flags': () =>
          mj.states['seen'] == true && currentScene == locationDesert,
    },
  ],
);

GameObject gasstation = GameObject(
  id: 'gasstation',
  name: 'Автозаправка',
  hidden: false,
  states: {
    'seenCosts': false,
    'seenPumps': false,
    'seenBuilding': false,
  },
  actions: [
    {
      'label': 'Осмотреть стойку',
      'logLabel': 'Осмотреть стойку',
      'text':
          'Высокая белая стойка с указанием, какие марки бензина здесь продавались. Электричества, естественно, нет и вместо цен — пустые чёрные окошки. Рядом с колонной — три пыльных, поникших флажка с эмблемой известной компании. Только она могла позволить себе строить и обслуживать вот такие заправки так далеко от городов.',
      'acts': () => gasstation.states['seenCosts'] = true,
    },
    {
      'label': 'Осмотреть колонки',
      'logLabel': 'Осмотреть колонки',
      'text':
          'Длинный навес, поддерживаемый тремя столбами, тянется от здания до самого шоссе. У каждого столба — по две раздаточные колонки, пыльные и с какими-то табличками на каждой. Мне с такого расстояния не видно, что за таблички. Вся площадка под навесом засыпана песком, наметённым с пустыни.',
      'acts': () => gasstation.states['seenPumps'] = true,
    },
    {
      'label': 'Осмотреть здание',
      'logLabel': 'Осмотреть здание',
      'text':
          'Одноэтажное белое строение. Наверное, место работы оператора, совмещённое с маленьким супермаркетом, как это обычно бывает. Отсюда убедиться не получится — ни одного окна не видно, а передний фасад полностью закрыт рольставнями. Под ставнями застряла пара перекати-поле.',
      'acts': () => gasstation.states['seenBuilding'] = true,
    },
  ],
  scenes: ['gas1'],
);

final objects = [
  ta,
  radio,
  glovebox,
  seat,
  urn,
  trunk,
  bottles,
  shine,
  tank,
  mj,
  gasstation,
];

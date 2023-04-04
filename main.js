var allEventComponent = new Vue({
    el: "#allEventComponent",
    data: {
      clickstatus: 'All',
      allevents: [
        {
          name: "BOWKYLION LANTA CONCERT",
          date: "18 Fabuary 2023",
          hall: "ธันเดอร์โดม เมืองทองธานี",
          status: "now",
          poster: "poster_01.jpg",
          carousel: "false",
          carousellink:
            "<iframe width='100%' height='100%' src='https://www.youtube.com/embed/6Ia6PLUZbCg?autoplay=1&mute=1' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share' allowfullscreen></iframe>",
        },
        {
          name: "YourMOOD x MIRRR x แลก BKK Concert",
          date: "27 December 2022",
          hall: "แลก BKK",
          status: "out",
          poster: "poster_02.jpg",
          carousel: "false",
          carousellink:
            "<iframe width='100%' height='100%' src='https://www.youtube.com/embed/6Ia6PLUZbCg?autoplay=1&mute=1' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share' allowfullscreen></iframe>",
        },
        {
          name: "BLACKPINK BORN PINK World tour Bangkok",
          date: "27 March 2023 - 28 March 2023",
          hall: "สนามราชมังคลากีฬาสถาน",
          status: "now",
          poster: "poster_03.jpg",
          carousel: "false",
          carousellink:
            "<iframe width='100%' height='100%' src='https://www.youtube.com/embed/6Ia6PLUZbCg?autoplay=1&mute=1' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share' allowfullscreen></iframe>",
        },
        {
          name: "In the Studio with 2 Days Ago Kids",
          date: "1 April 2023",
          hall: "SEARCH STUDIO รามคำแหง 81",
          status: "now",
          poster: "poster_04.png",
          carousel: "false",
          carousellink:
            "<iframe width='100%' height='100%' src='https://www.youtube.com/embed/6Ia6PLUZbCg?autoplay=1&mute=1' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share' allowfullscreen></iframe>",
        },
        {
          name: "2023 JI CHANG WOOK FAN MEETING < REACH YOU > in BANGKOK",
          date: "8 April 2023",
          hall: "รอยัล พารากอน ฮอลล์",
          status: "now",
          poster: "poster_05.jpg",
          carousel: "false",
          carousellink:
            "<iframe width='100%' height='100%' src='https://www.youtube.com/embed/6Ia6PLUZbCg?autoplay=1&mute=1' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share' allowfullscreen></iframe>",
        },
        {
          name: "ITZY THE 1ST WORLD TOUR < CHECKMATE > BANGKOK",
          date: "8 April 2023",
          hall: "ธันเดอร์โดม เมืองทองธานี",
          status: "soon",
          poster: "poster_06.jpg",
          carousel: "false",
          carousellink:
            "<iframe width='100%' height='100%' src='https://www.youtube.com/embed/6Ia6PLUZbCg?autoplay=1&mute=1' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share' allowfullscreen></iframe>",
        },
        {
          name: "INKSYLAND ดินเเดนขยี้ใจ คอนเสิร์ตครั้งใหญ่ ก้าวใหม่ของ อิ้งค์ วรันธร ",
          date: "31 August 2023",
          hall: "IMPACT ARENA",
          status: "out",
          poster: "poster_07.jpg",
          description:
            "“ คนใหม่เขาดูแลอยู่ ” ซิงเกิลที่ 2 จากอิ้งค์ วรันธร ที่สะท้อนความรู้สึกของคนที่ถึงเวลาต้องมูฟออนแล้วโดยเพลงนี้ อิ้งค์ ได้ไอเดียมาจากการที่เพลงช้าของอัลบั้มที่แล้ว มักจะพูดถึงการมูฟออนเป็นวงกลม เหมือนจะลืมแต่ไม่ลืม อยากเริ่มต้นใหม่แต่ก็อยากเริ่มกับคนเดิม แต่เมื่อมาถึงความรู้สึกตอนนี้ ก็อยากจะพูดในมุมมองที่เติบโตและเข้าใจมากขึ้นว่าถึงเวลาต้องปล่อยมือและก้าวออกมา ปล่อยให้คนใหม่เขาดูแลได้แล้ว",
          carousel: "true",
          carousellink:
            "<iframe class='ccc' width='100%' height='80%' src='https://www.youtube.com/embed/6Ia6PLUZbCg?autoplay=1&mute=1' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share' allowfullscreen></iframe>",
        },
      ],
    },
  });
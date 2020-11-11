const navSlide = () => {
	const burger = document.querySelector('.burger');
	const nav = document.querySelector('.navBar');
	const navLinks = document.querySelectorAll('.navBar li');
	
	burger.addEventListener('click', () => {
		
		//Toggle navBar
		nav.classList.toggle('nav-active');
	
	})
}
navSlide();
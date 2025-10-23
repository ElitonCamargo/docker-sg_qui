$(document).ready(function() {
    const themeToggleBtn = $('#theme-toggle');
  
    // Função para alternar o tema e salvar a preferência no localStorage
    function toggleTheme() {
        const htmlTag = $('html');
  
        // Verifica se o atributo 'data-bs-theme' está definido na tag <html>
        const isDarkTheme = htmlTag.attr('data-bs-theme') === 'dark';
  
        // Alterna entre os temas e ajusta o atributo 'data-bs-theme' na tag <html>
        if (isDarkTheme) {
            htmlTag.removeAttr('data-bs-theme');
            localStorage.setItem('theme', 'light');
        } else {
            htmlTag.attr('data-bs-theme', 'dark');
            localStorage.setItem('theme', 'dark');
        }
    }
  
    // Carregar o tema salvo no localStorage ou a preferência do sistema operacional/navegador
    const prefersDarkTheme = window.matchMedia('(prefers-color-scheme: dark)').matches;
    const savedTheme = localStorage.getItem('theme');
  
    if (savedTheme) {
        $('html').attr('data-bs-theme', savedTheme);
    } else if (prefersDarkTheme) {
        $('html').attr('data-bs-theme', 'dark');
    }
  
    // Adicionar evento ao botão de alternar tema
    themeToggleBtn.on('click', toggleTheme);
});

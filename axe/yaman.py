from selenium import webdriver
from axe_selenium_python import Axe
import json

# Mapeamento de severidade
SEVERITY_MAP = {
    'minor': '🟢 Leve',
    'moderate': '🟡 Moderada',
    'serious': '🟠 Grave',
    'critical': '🔴 Crítica'
}


def validate_accessibility(url):
    options = webdriver.ChromeOptions()
    options.add_argument("--headless")
    driver = webdriver.Chrome(options=options)

    try:
        driver.get(url)
        axe = Axe(driver)
        axe.inject()
        results = axe.run()

        # Salva os resultados em um arquivo JSON
        with open('accessibility_report.json', 'w') as file:
            json.dump(results, file, indent=4)

        page_title = driver.title
        print(f"\n🌐 **Analisando página:** {page_title}\n")

        violations = results["violations"]
        if violations:
            print(f"\n❌ {len(violations)} problemas de acessibilidade encontrados:\n")
            for issue in violations:
                # Classifica a severidade
                severity = SEVERITY_MAP.get(issue['impact'], 'Desconhecida')
                print(f"➡️  {issue['help']} **({severity})**")

                for node in issue['nodes']:
                    try:
                        element = driver.find_element("css selector", node['target'][0])
                        element_name = element.text if element.text else "N/A"
                        element_type = element.tag_name  # Captura o tipo do elemento (ex: div, button, span)
                        print(f"   → Elemento afetado: {node['target'][0]}")
                        print(f"     → Tipo: {element_type}")
                        print(f"     → Nome exibido na tela: {element_name}\n")
                    except Exception as e:
                        print(f"   → Erro ao capturar elemento: {e}")

        else:
            print("\n✅ Nenhum problema de acessibilidade encontrado!")

    finally:
        driver.quit()


# URL da página a ser analisada
url = " https://www.w3.org/WAI/test-evaluate/"
validate_accessibility(url)

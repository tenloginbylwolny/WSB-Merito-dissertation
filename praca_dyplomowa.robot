*** Settings ***
Library           SeleniumLibrary



*** Variables ***
${URL}            https://www.audi.pl/pl/web/pl.html
${BROWSER}        Chrome
${code}  ${EMPTY}
${price}  ${EMPTY}
${code1}  ${EMPTY}
${price1}  ${EMPTY}

*** Test Cases ***

Audi home page test - Footer
    Open Browser    ${URL}    ${BROWSER}     
    Maximize Browser Window
    Wait
    Accept cookies
    Check footer link models
    Check footer link special offers
    Check footer audi offers
    Check footer link financing
    Check footer link test drive
    Check footer link audi for business
    Check footer link audi exclusive
    Check footer link audi expert online
    Check footer link audi dealers
    Check footer link audi electromobility
    Check footer link all electrical models
    Check footer link all plugin hybrid models
    Check footer link charging
    Check footer link range
    Check footer link WLTP
    Check footer R / RS models link
    Check footer Audi electromobility experts link
    Check footer Accessories link
    Check footer service and spare parts link
    Check footer Audi connect link
    Check footer accident repair center link
    Check footer warranty link
    Check footer Audi recall link
    Check footer online shop link
    Check footer Audi Connect Plug&Play link
    Check footer Technology link
    Check footer Future link
    Check footer Design link
    Check footer Lifestyle link
    Check footer sustainable development link
    Check footer Audi sport link
    Check footer mark history link
    Check footer news link

Audi home page test - Configurator and Audi code
    Open all models page
    Check models page's title
    Check models URL
    Click meet the model below A4 Limo image
    Check and click 'Start config' CTA
    Select 'S-Line' checkbox
    Select 'Carbon mirrors' checkbox
    Go to engine & drive section by CTA in the cart (bottom bar) clicking
    Select diesel engine and Quattro drive, finally select S line 40 TDI quattro S tronic variant and open its details overlay
    Check show more info about selected variant link on the variant info overlay and close the overlay
    Go to design section by CTA in the cart (bottom bar) clicking
    Select the fastest color (red)
    Select 19 inch rims
    Accept changes in the conflict window
    Expand headlights section
    Add to configuration headlights washing system
    Go to interior section by CTA in the cart (bottom bar) clicking
    Select front sport seats
    Select eco-leather upholstery and apply changes in the conflict window
    Go to equipment section by CTA in the cart (bottom bar) clicking
    Click search button, perform search for equipment and add exhaust add-on
    Add to the configuration Matrix LED headlights, in the conflict window accept changes
    Go to accessories section by CTA in the cart (bottom bar) clicking
    Expand Transport section and add roof box to the configuration
    Go to summary section by CTA in the cart (bottom bar) clicking
    Download PDF offer
    Copy Audi Code and price
    Reopen browser and the page, check is configuration loads after using Audi code
    Check if valid configuration loaded



*** Keywords ***

Open main page

    Open browser ${URL} ${BROWSER}
    Title Should Be Audi Polska | Przewaga dzięki technice

Wait

    BuiltIn.Sleep   5s

Wait until page load

    Wait For Condition	return document.readyState == "complete"

Mark S-Line checkbox  

    shadow_host = driver.find_element(By.CSS_SELECTOR, "div[data-configurator-id='trimline_sline'] a[class='nm-checkbox-1 nm-j-configurator-delegate-click']")
    shadow_root = driver.execute_script("return arguments[0].shadowRoot", shadow_host)
    checkbox_inside_shadow_dom = shadow_root.find_element(By.CSS_SELECTOR, "input[type='checkbox']")
    checkbox_inside_shadow_dom.click()

Accept cookies

    Click Element   //button[@id='ensCloseBanner']
    Wait until page load
    

Check footer link models

    Click Element   //a[@href='https://www.audi.pl/pl/web/pl/modele.html'][contains(text(),'Wszystkie modele')]
    Title Should Be     Modele Audi > Audi Polska | Przewaga dzięki technice
    Location Should Be   https://www.audi.pl/pl/web/pl/modele.html
    

Check footer link special offers

    Click Element   //a[normalize-space()='Oferty specjalne']
    Wait
    Switch Window    NEW
    Wait until page load
    Wait until element is Visible       //div[@class='font-normal font20']      10s
    Title Should Be     Oferta Promocyjna Audi - Strona główna
    Location Should Contain   https://ofertyspecjalneaudi.pl/
    Close Window
    Switch Window       main
    Wait


Check footer audi offers

    Click Element        //li[@data-is-overview-link='false']//a[contains(text(),'Oferty Audi')]
    Wait Until Page Load
    Title Should Be     Oferty Audi > Audi Polska | Przewaga dzięki technice
    Location Should Be   https://www.audi.pl/pl/web/pl/oferty-audi.html

Check footer link financing

    Click Element   //li[@data-is-overview-link='false']//a[contains(text(),'Finansowanie i ubezpieczenia')]
    Wait Until Page Load
    Title Should Be     Audi | Finansowanie dla klientów prywatnych i przedsiębiorców
    Location Should Be    https://www.audi.pl/pl/web/pl/finansowanie.html
    Wait

Check footer link test drive
 
    Click Element    //a[contains(text(),'Jazda testowa')]
    Wait Until Page Load        
    Wait Until Element Is Visible        //div[contains(@class,'nm-layer__close-button nm-j-layer-close-button')]       timeout=15s
    Location Should Be    https://www.audi.pl/pl/web/pl.html#layer=/pl/web/pl/modele/layer/jazda-testowa.html
    Title Should Be    Jazda testowa > Audi Polska | Przewaga dzięki technice
    Click Element    //div[contains(@class,'nm-layer__close-button nm-j-layer-close-button')]
    Wait
    Location Should Be    https://www.audi.pl/pl/web/pl.html#
    

Check footer link audi for business

    Click Element       //li[@data-is-overview-link='false']//a[contains(text(),'Audi dla biznesu')]
    Wait Until Page Load
    Title Should Be     Audi dla biznesu > Audi | Finansowanie dla klientów prywatnych i przedsiębiorców > Audi Polska | Przewaga dzięki technice
    Location Should Be   https://www.audi.pl/pl/web/pl/finansowanie/audi-dla-biznesu.html

Check footer link audi exclusive

    Click Element   //li[@data-is-overview-link='false']//a[contains(text(),'Audi exclusive')]
    Wait Until Page Load
    Title Should Be     Audi exclusive > Audi Polska | Przewaga dzięki technice
    Location Should Be  https://www.audi.pl/pl/web/pl/audi-exclusive.html
    Wait

Check footer link audi expert online

    Click Element   //li[@data-is-overview-link='false']//a[contains(text(),'Audi Ekspert online')]
    Wait Until Page Load
    Title Should Be     Audi Ekspert Online > Strefa klienta > Audi Polska | Przewaga dzięki technice
    Location Should Be  https://www.audi.pl/pl/web/pl/strefa-klienta/audi-ekspert-online.html
    Wait

Check footer link audi dealers

    Click Element    //li[@data-is-overview-link='false']//a[contains(text(),'Dealerzy Audi')]
    Switch Window       NEW
    Wait until page load
    Title Should Be     Dealerzy i partnerzy serwisowi
    Location Should Contain   https://dealerzy.audi.pl/
    Wait Until Element Is Visible    //button[contains(text(),'Akceptuję')]
    Click Element       //button[contains(text(),'Akceptuję')]
    Close Window
    Switch Window       main
    Wait

Check footer link audi electromobility

    Click Element   //li[@data-is-overview-link='false']//a[contains(text(),'Elektromobilność Audi')]
    Wait Until Page Load
    Title Should Be     Elektromobilność Audi
    Location Should Be  https://www.audi.pl/pl/web/pl/strefa-klienta/elektromobilnosc.html
    Wait

Check footer link all electrical models

    Click Element   //li[@data-is-overview-link='false']//a[contains(text(),'Wszystkie modele elektryczne')]
    Wait Until Page Load
    Title Should Be     Modele Audi > Audi Polska | Przewaga dzięki technice
    Location Should Be  https://www.audi.pl/pl/web/pl/modele.html?bytype=naped-elektryczny&bycarlinegroup=etrongt,etron,q4
    Element Should Be Visible   //audi-filter-tag[contains(text(),'e-tron GT')]
    Element Should Be Visible   //audi-filter-tag[contains(text(),'Napęd elektryczny')]
    Wait

Check footer link all plugin hybrid models

    Wait Until Element Is Visible       //li[@data-is-overview-link='false']//a[contains(text(),'Wszystkie hybrydy plug-in')]  
    Click Element   //li[@data-is-overview-link='false']//a[contains(text(),'Wszystkie hybrydy plug-in')]
    Wait Until Page Load
    Title Should Be     Modele Audi > Audi Polska | Przewaga dzięki technice
    Location Should Be  https://www.audi.pl/pl/web/pl/modele.html?bytype=hybrid
    Element Should Be Visible   //audi-filter-tag[contains(text(),'Plug-in Hybrid')]
    Wait

Check footer link charging

    Set Focus To Element        //li[@data-is-overview-link='false']//a[contains(text(),'Ładowanie')]
    Click Element           //li[@data-is-overview-link='false']//a[contains(text(),'Ładowanie')]
    Element Should Be Visible     //audi-intro[@class='legacy audi-intro nm-intro nm-j-intro-show']//h2[@class='nm-intro__headline audi-headline-order-1'][contains(text(),'Ładowanie')]
    Wait until page load
    Title Should Be     Ładowanie > Elektromobilność Audi > Audi Polska | Przewaga dzięki technice
    Location Should Be      https://www.audi.pl/pl/web/pl/strefa-klienta/elektromobilnosc/ladowanie.html
    Wait

Check footer link range

    Click Element   //li[@data-is-overview-link='false']//a[contains(text(),'Zasięg')]
    Wait Until Page Load
    Title Should Be     Zasięg samochodu elektrycznego > Elektromobilność Audi > Audi Polska | Przewaga dzięki technice
    Location Should Be  https://www.audi.pl/pl/web/pl/strefa-klienta/elektromobilnosc/zasieg.html
    Wait

Check footer link WLTP

    Wait Until Element Is Visible       //a[contains(text(),'WLTP')]        timeout=15s
    Execute JavaScript         document.querySelector("a[href='https://www.audi.pl/pl/web/pl/swiat-audi/ochrona-srodowiska/wltp-lp.html']").click()
    BuiltIn.Sleep       5s
    Switch Window        NEW
    Wait Until Page Load
    Title Should Be     WLTP > Audi Polska | Przewaga dzięki technice
    Location Should Be  https://www.audi.pl/pl/web/pl/swiat-audi/ochrona-srodowiska/wltp-lp.html       
    Wait
    Close Window
    Wait
    Switch Window       main
   

Check footer R / RS models link
    
    Page Should Contain Link       //a[contains(text(), 'Audi R / RS')]     
    Execute JavaScript          document.querySelector("li:nth-child(2) div:nth-child(2) ul:nth-child(1) li:nth-child(4) a:nth-child(1)").click()
    Wait until page load
    Title Should Be     Audi R / RS > Audi Polska | Przewaga dzięki technice
    Location Should Be  https://www.audi.pl/pl/web/pl/audi-r-rs.html
    Wait

Check footer Audi electromobility experts link

    Click Element       //li[@data-is-overview-link='false']//a[contains(text(),'Eksperci elektromobilności Audi')]
    Wait Until Page Load
    Title Should Be     Eksperci elektromobilności Audi > Elektromobilność Audi > Strefa klienta > Audi Polska | Przewaga dzięki technice
    Location Should Be  https://www.audi.pl/pl/web/pl/strefa-klienta/elektromobilnosc/layer/eksperci-elektromobilnosci-audi.html
    Wait


Check footer Accessories link

    Click Element       //li[@data-is-overview-link='false']//a[contains(text(),'Akcesoria')]
    Wait Until Page Load
    Title Should Be     Oryginalne akcesoria Audi > Strefa klienta > Audi Polska | Przewaga dzięki technice
    Location Should Be  https://www.audi.pl/pl/web/pl/strefa-klienta/akcesoria.html
    Wait

Check footer service and spare parts link

    Click Element       //li[@data-is-overview-link='false']//a[contains(text(),'Serwis i części')]
    Wait Until Page Load
    Title Should Be     Serwis i części
    Location Should Be  https://www.audi.pl/pl/web/pl/strefa-klienta/twoje-korzysci.html
    Wait

Check footer Audi connect link

    Click Element       //li[@data-is-overview-link='false']//a[contains(text(),'Audi connect')]
    Wait Until Page Load
    Title Should Be     Audi connect
    Location Should Be  https://www.audi.pl/pl/web/pl/strefa-klienta/audi-connect.html
    Wait

Check footer accident repair center link

    Click Element       //li[@data-is-overview-link='false']//a[contains(text(),'Centrum napraw powypadkowych')]
    Wait Until Page Load
    Title Should Be     Centrum napraw powypadkowych > Twoje Korzyści > Audi Polska | Przewaga dzięki technice
    Location Should Be  https://www.audi.pl/pl/web/pl/strefa-klienta/twoje-korzysci/centrum-napraw-powypadkowych.html
    Wait

Check footer warranty link

    Click Element       //li[@data-is-overview-link='false']//a[contains(text(),'Gwarancja')]
    Wait Until Page Load
    Title Should Be     Gwarancja Audi > Twoje Korzyści > Audi Polska | Przewaga dzięki technice
    Location Should Be  https://www.audi.pl/pl/web/pl/strefa-klienta/twoje-korzysci/gwarancja-audi.html
    Wait

Check footer Audi recall link

    Click Element       //li[@data-is-overview-link='false']//a[contains(text(),'Akcje serwisowe Audi')]
    Wait Until Page Load
    Title Should Be     Oferty Audi > Twoje Korzyści > Audi Polska | Przewaga dzięki technice
    Location Should Be  https://www.audi.pl/pl/web/pl/strefa-klienta/twoje-korzysci/akcje-serwisowe.html
    Wait

Check footer online shop link

    Click Element       //li[@data-is-overview-link='false']//a[contains(text(),'Sklep online')]
    Wait Until Page Load
    Switch Window       NEW
    Title Should Be     Strona główna - Sklep Audi
    Location Should Contain  https://sklep.audi.pl/
    Wait until Element is Visible       //button[contains(text(),'Akceptuję')]
    Click Element       //button[contains(text(),'Akceptuję')]
    Close Window
    Switch Window       main
    Wait

Check footer Audi Connect Plug&Play link

    Click Element       //li[@data-is-overview-link='false']//a[normalize-space()='Audi Connect Plug&Play']
    Wait Until Page Load
    Switch Window       NEW
    Title Should Be     Audi Connect Plug&Play > Twoje Korzyści > Audi Polska | Przewaga dzięki technice
    Location Should Be  https://www.audi.pl/pl/web/pl/strefa-klienta/twoje-korzysci/audi-connect-plug-and-play.html
    Close Window
    Switch Window       main
    Wait

Check footer Technology link

    Click Element       //li[@data-is-overview-link='false']//a[contains(text(),'Technologia')]
    Wait Until Page Load
    Title Should Be     Technologia > Stories of Progress > Audi Polska | Przewaga dzięki technice
    Location Should Be  https://www.audi.pl/pl/web/pl/stories/technologia.html

Check footer Future link

    Click Element       //li[@data-is-overview-link='false']//a[contains(text(),'Przyszłość')]
    Wait Until Page Load
    Title Should Be     Przyszłość > Stories of Progress > Audi Polska | Przewaga dzięki technice
    Location Should Be  https://www.audi.pl/pl/web/pl/stories/przyszlosc.html  

Check footer Design link

    Click Element       //li[@data-is-overview-link='false']//a[contains(text(),'Design')]
    Wait Until Page Load
    Title Should Be     Design > Stories of Progress > Audi Polska | Przewaga dzięki technice
    Location Should Be  https://www.audi.pl/pl/web/pl/stories/design.html

Check footer Lifestyle link

    Click Element       //li[@data-is-overview-link='false']//a[contains(text(),'Styl życia')]
    Wait Until Page Load
    Title Should Be     Styl życia > Stories of Progress > Audi Polska | Przewaga dzięki technice
    Location Should Be  https://www.audi.pl/pl/web/pl/stories/styl-zycia.html 

Check footer sustainable development link

    Click Element       //li[@data-is-overview-link='false']//a[contains(text(),'Zrównoważony rozwój')]
    Wait Until Page Load
    Title Should Be     Zrównoważony rozwój > Stories of Progress > Audi Polska | Przewaga dzięki technice
    Location Should Be  https://www.audi.pl/pl/web/pl/stories/zrownowazony-rozwoj.html

Check footer Audi sport link

    Click Element       //a[contains(text(),'Audi Sport')]
    Wait Until Page Load
    Title Should Be     Audi Sport > Stories of Progress > Audi Polska | Przewaga dzięki technice
    Location Should Be  https://www.audi.pl/pl/web/pl/stories/audi-sport.html

Check footer mark history link

    Click Element       //a[contains(text(),'Historia marki')]
    Wait Until Page Load
    Title Should Be     Historia marki > Audi Polska | Przewaga dzięki technice
    Location Should Be  https://www.audi.pl/pl/web/pl/historia-marki.html

Check footer news link

    Click Element       //a[contains(text(),'Aktualności')]
    Wait Until Page Load
    Title Should Be     Aktualności > Audi Polska | Przewaga dzięki technice
    Location Should Be  https://www.audi.pl/pl/web/pl/aktualnosci.html



Open all models page

    Click Element       //a[@href='https://www.audi.pl/pl/web/pl/modele.html'][contains(text(),'Wszystkie modele')] 

Check models page's title

    Title Should Be     Modele Audi > Audi Polska | Przewaga dzięki technice 

Check models URL

    Location Should Be  https://www.audi.pl/pl/web/pl/modele.html 
    Wait Until Page Load

Click meet the model below A4 Limo image

    Execute JavaScript      document.querySelector("body > div:nth-child(2) > div:nth-child(2) > div:nth-child(2) > audi-modelfinder:nth-child(2) > div:nth-child(2) > audi-modelfinder-carlinegroup:nth-child(7) > div:nth-child(4) > div:nth-child(1) > audi-modelfinder-car-model:nth-child(2) > div:nth-child(3) > a:nth-child(1)").click()

Check and click 'Start config' CTA

    Wait
    Wait Until Element Is Visible     //span[contains(text(),'Rozpocznij konfigurację')]            timeout=15s
    Click link          xpath=//a[contains(@href, 'https://www.audi.pl/pl/web/pl/modele/a4/a4-limousine/pakiety.html')]
    Wait Until Page Load    
    Wait Until Page Contains    S line  timeout=30s

Select 'S-Line' checkbox

    Execute JavaScript    document.querySelector("div[data-configurator-id='trimline_sline'] a[class='nm-checkbox-1 nm-j-configurator-delegate-click']").click()
    BuiltIn.Sleep   5s

Select 'Carbon mirrors' checkbox

    Execute JavaScript       document.querySelector("div[data-configurator-id='YKG'] span[class='audi-checkbox-symbol nm-module-optionlist-v2-checkbox-symbol']").click()

Accept configuration conflict

    Wait Until Element Is Visible        //a[@class='nm-j-configurator-delegate-conflict-click nm-el-btn nm-el-btn-02']   
    Click Element      //a[@class='nm-j-configurator-delegate-conflict-click nm-el-btn nm-el-btn-02']

Go to engine & drive section by CTA in the cart (bottom bar) clicking

    Click Element      //a[@type='button'][contains(text(),'Silnik i napęd')]
    Wait until Page Load
    Location Should Be  https://www.audi.pl/pl/web/pl/modele/a4/a4-limousine/silnik.html


Select diesel engine and Quattro drive, finally select S line 40 TDI quattro S tronic variant and open its details overlay

    Execute JavaScript    document.querySelector(".nm-module-engine-selection-filter-group:nth-child(4) > .nm-module-engine-selection-filter-label:nth-child(2) .audi-checkbox-symbol").click()
    Wait
    Execute JavaScript    document.querySelector(".nm-module-engine-selection-filter-group:nth-child(5) > .nm-module-engine-selection-filter-label:nth-child(3) .audi-checkbox-symbol").click()
    Wait
    Execute JavaScript    document.querySelector(".nm-module-engine-selection-engine:nth-child(23) .audi-checkbox-symbol").click()
    Wait
    Execute JavaScript    document.querySelector(".nm-j-configurator-status_11010 .nm-layerLink").click()
    Wait

Check show more info about selected variant link on the variant info overlay and close the overlay

    Click Element       //span[contains(text(),'Pokaż wszystkie informacje')]
    Wait
    Click Element       //div[@class='nm-layer__close-button nm-j-layer-close-button']
    Wait

Go to design section by CTA in the cart (bottom bar) clicking

    Click Element      //a[@type='button'][contains(text(),'Stylistyka')]
    Wait until Page Load
    Location Should Be  https://www.audi.pl/pl/web/pl/modele/a4/a4-limousine/stylistyka.html
    

Select the fastest color (red)

    Execute JavaScript    document.querySelector(".legacy:nth-child(4) .nm-j-configurator-item:nth-child(5) .nm-module-tiles-categorized-image").click()
    Wait

Select 19 inch rims

    Execute JavaScript    document.querySelector('img[src*="cb9fb95b-76f0-42c7-aee2-49b478f6b91e.jpg"]').click()
    Wait

Accept changes in the conflict window

    Click Element      //a[@class='nm-j-configurator-delegate-conflict-click nm-el-btn nm-el-btn-02']
    Wait

Expand headlights section

    Execute JavaScript      document.querySelector(".nm-mode-expert-group-wrap:nth-child(3) > .nm-module-options-container-headline").click()
    Wait

Add to configuration headlights washing system

    Execute JavaScript      document.querySelector(".nm-mode-expert-group-wrap:nth-child(3) .nm-j-configurator-item:nth-child(4) .audi-checkbox-symbol").click()
    

Go to interior section by CTA in the cart (bottom bar) clicking

    Click Element      //a[@type='button'][contains(text(),'Wnętrze')]
    Wait until Page Load
    Location Should Be  https://www.audi.pl/pl/web/pl/modele/a4/a4-limousine/wnetrze.html

Select front sport seats

    Execute JavaScript        document.querySelector(".nm-option-tile-item-wrapper:nth-child(4) .audi-checkbox-symbol").click()
    Wait 
    

Select eco-leather upholstery and apply changes in the conflict window

    Execute JavaScript        document.querySelector(".nm-j-configurator-item:nth-child(1) > .nm-tile-element-image img").click()
    Wait   
    Click Element      //a[@class='nm-j-configurator-delegate-conflict-click nm-el-btn nm-el-btn-02']
    Wait
    

Go to equipment section by CTA in the cart (bottom bar) clicking

    Click Element      //a[@type='button'][contains(text(),'Wyposażenie')]
    Wait until Page Load
    Location Should Be  https://www.audi.pl/pl/web/pl/modele/a4/a4-limousine/wyposazenie.html

Click search button, perform search for equipment and add exhaust add-on

    Execute JavaScript      document.querySelector(".nm-jslayerLink.nm-el-btn-equipment-search.nm-el-btn.nm-el-btn-01").click()
    Wait
    Click Element       //input[@placeholder='Wpisz nazwę elementu wyposażenia']
    Input text      //input[@placeholder='Wpisz nazwę elementu wyposażenia']     sportowe
    Wait
    Element Should Be Visible     //p[@class='nm-j-configurator-name nm-el-lbl nm-el-lbl-01 nm-at-lbl-b'][contains(text(),'Sportowe siedzenia przednie')]
    Execute JavaScript      document.querySelector("input[value='X']").click()
    Click Element       //input[@placeholder='Wpisz nazwę elementu wyposażenia']
    Input text      //input[@placeholder='Wpisz nazwę elementu wyposażenia']     wydech
    Wait
    Execute JavaScript      document.querySelector("body div[class='nm-layer-wrapper nm-layer-wrapper-equipment-search-layer'] li li:nth-child(1) div:nth-child(1) div:nth-child(2) div:nth-child(2) a:nth-child(1)").click()
    Wait
    Execute JavaScript      document.querySelector("a[class='nm-el-btn nm-el-btn-02 nm-md-media-library-configuration-button nm-j-configurator-delegate-click'] span[class='nm-at-btn-state01']").click()
    Wait
    Execute JavaScript      document.querySelector("div[class='nm-layer nm-layer-visible'] div[class='nm-layer__close-button nm-j-layer-close-button']").click()
    Wait
    Execute JavaScript      document.querySelector(".nm-layer__close-button.nm-j-layer-close-button").click()
    Wait

Add to the configuration Matrix LED headlights, in the conflict window accept changes

    Execute JavaScript    document.querySelector(".legacy:nth-child(6) .audi-button__text:nth-child(3)").click()
    Wait Until Element Is Visible         css=.nm-j-configurator-delegate-conflict-click.nm-el-btn.nm-el-btn-02
    Execute JavaScript      document.querySelector(".nm-j-configurator-delegate-conflict-click.nm-el-btn.nm-el-btn-02").click()
    Wait
    

Go to accessories section by CTA in the cart (bottom bar) clicking

    Click Element      //a[@type='button'][contains(text(),'Akcesoria')]
    Wait until Page Load
    Location Should Be  https://www.audi.pl/pl/web/pl/modele/a4/a4-limousine/akcesoria.html

Expand Transport section and add roof box to the configuration

    Execute JavaScript      document.querySelector(".nm-mode-expert-group-wrap:nth-child(4) > .nm-module-options-container-headline").click()
    Wait
    Execute JavaScript      document.querySelector(".nm-mode-expert-group-wrap:nth-child(4) > .nm-module-options-container-configuration-container:nth-child(2) .nm-j-configurator-item:nth-child(3) .audi-checkbox-symbol").click()
    Wait

Go to summary section by CTA in the cart (bottom bar) clicking

    Execute JavaScript     document.querySelector("div[class='audi-basket audi-basket--sticky audi-basket--desktop'] a[class=' nm-pageOpen audi-basket-button-cta audi-button audi-button--inverted']").click()
    Wait until Page Load
    Location Should Be  https://www.audi.pl/pl/web/pl/modele/a4/a4-limousine/podsumowanie.html
    Wait
    Execute JavaScript       window.scrollBy(0, 500)
    BuiltIn.Sleep   20s
    ${element_visible}    Run Keyword And Return Status    Element Should Be Visible    xpath=//*[@data-link-type='pdf']
    Run Keyword If    not ${element_visible}
    ...    Log To Console       'Configuration summary not visible!'
    Run Keyword If    not ${element_visible}   
    ...    Capture Page Screenshot 
    Run Keyword If    not ${element_visible}
    ...    Reload Page
    Wait Until Page Contains Element    xpath=//*[@data-link-type='pdf']
    Scroll Element Into View        xpath=//*[@data-link-type='pdf']
    

Download PDF offer

    ${element_visible}    Run Keyword And Return Status    Element Should Be Visible    css:[data-link-type="pdf"]
    Run Keyword If    not ${element_visible}
    ...    Log To Console       'Configuration summary not visible again!'
    Run Keyword If    not ${element_visible}
    ...    Capture Page Screenshot 
    Wait
    Run Keyword If    not ${element_visible}
    ...    Reload Page
    Wait Until Element Is Visible    css:[data-link-type="pdf"]
    Set Focus To Element        css:[data-link-type="pdf"]
    Click Element    css:[data-link-type="pdf"]
    Wait
    Switch Window       NEW
    Wait
    Close Window
    Wait
    Switch Window       main
   
    

Copy Audi Code and price

    Wait Until Element Is Visible    //div[@class='audi-basket-configuration-value audi-basket-overview-prices__price-value audi-basket__price-total audi-basket__additional-prices']//span[@class='audi-copy-s']//span[@class='audi-basket-configuration-value__label']
    ${price}   Get Text    //div[@class='audi-basket-configuration-value audi-basket-overview-prices__price-value audi-basket__price-total audi-basket__additional-prices']//span[@class='audi-copy-s']//span[@class='audi-basket-configuration-value__label']
    Set Global Variable    ${price}         ${price} 
    Wait
    Execute JavaScript    document.evaluate("//span[contains(text(), 'Kod Audi')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
    Wait
    ${code}    Get Text    xpath=//div[contains(@class, 'nm-audicode nm-j-audicode nm-label-ac nm-el-lbl nm-el-lbl-04')]
    Set Global Variable    ${code}         ${code} 
    Log To Console     Audi code is: ${code}
    Log To Console     Audi price is: ${price}
    Wait


Reopen browser and the page, check is configuration loads after using Audi code

    Close Browser
    Open Browser    ${URL}    ${BROWSER}     
    Maximize Browser Window
    Set Selenium Speed      0.08
    Wait
    Accept cookies
    Click Element             xpath=//button[@aria-label='Szukaj']
    Wait 
    Input text         //input[@id='search__basic']     ${code}
    Wait
    Press Keys   //input[@id='search__basic']   ENTER
    Wait

Check if valid configuration loaded

    Wait
    Execute JavaScript           document.querySelector('.sc-ptDSg').click()   
    BuiltIn.Sleep       20s
    Wait Until Page Load
    Click Element      css=.nm-configurationstart-layer-close
    Wait Until Page Load
    ${price2}   Get Text    //div[@class='audi-basket-configuration-value audi-basket-overview-prices__price-value audi-basket__price-total audi-basket__additional-prices']//span[@class='audi-copy-s']//span[@class='audi-basket-configuration-value__label']
    Wait
    Execute JavaScript    document.evaluate("//span[contains(text(), 'Kod Audi')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
    Wait
    ${code2}    Get Text    xpath=//div[contains(@class, 'nm-audicode nm-j-audicode nm-label-ac nm-el-lbl nm-el-lbl-04')]
    Run Keyword If    '${price}' == '${price2}'    Log To Console    Loaded Audi price is the same as configured model
    Run Keyword If    '${code}' == '${code2}'    Log To Console    Loaded Audi model is the same as configured model
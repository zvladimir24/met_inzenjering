import 'package:flutter/material.dart';
import '../l10n/app_locale.dart';

class SectionCopy {
  final L10nText eyebrow;
  final L10nText title;
  final L10nText? subtitle;
  const SectionCopy({required this.eyebrow, required this.title, this.subtitle});
}

class NavItem {
  final L10nText label;
  final String sectionKey;
  const NavItem(this.label, this.sectionKey);
}

const List<NavItem> navItems = [
  NavItem(L10nText('About', 'O nama'), 'about'),
  NavItem(L10nText('Capabilities', 'Mogućnosti'), 'capabilities'),
  NavItem(L10nText('Facilities', 'Pogoni'), 'facilities'),
  NavItem(L10nText('Products', 'Proizvodi'), 'products'),
  NavItem(L10nText('Partners', 'Partneri'), 'partners'),
  NavItem(L10nText('Quality', 'Kvalitet'), 'quality'),
  NavItem(L10nText('Contact', 'Kontakt'), 'contact'),
];

// Shared CTA / misc copy
const ctaGetQuote = L10nText('Get a Quote', 'Zatražite ponudu');
const ctaExploreCapabilities = L10nText('Explore Capabilities', 'Istražite mogućnosti');
const footerCopyright = L10nText('© Met Inženjering Novi Sad · Kula, Serbia', '© Met Inženjering Novi Sad · Kula, Srbija');
const isoCertifiedNote = L10nText(
  'ISO Certified — ISO 9001 · ISO 14001 · ISO 3834-3 | Quality Austria certified management system.',
  'Sertifikovano prema ISO standardima — ISO 9001 · ISO 14001 · ISO 3834-3 | Sistem upravljanja sertifikovan od strane Quality Austria.',
);

// Hero
const heroTitle = 'MET INŽENJERING\nNOVI SAD';
const heroSubtitle = L10nText(
  'Precision-engineered steel transformer tanks and industrial metal structures, built to the highest international standards for utilities and industrial clients across Europe and North America.',
  'Precizno projektovani čelični kotlovi za transformatore i industrijske metalne konstrukcije, izrađeni prema najvišim međunarodnim standardima za komunalna preduzeća i industrijske klijente širom Evrope i Severne Amerike.',
);

// About
const aboutCopy = SectionCopy(
  eyebrow: L10nText('About the company', 'O kompaniji'),
  title: L10nText(
    'Decades of fabrication expertise,\nmodernized for transformer tanks',
    'Decenije iskustva u proizvodnji,\nmodernizovane za izradu transformatorskih kotlova',
  ),
);
const aboutIntro = L10nText(
  "MET INŽENJERING is an established manufacturer of tanks and supporting structures for hydraulic power units, "
      "supplying some of the world's leading names in hydraulics. Since 2023, the company has expanded into "
      "transformer tank production, combining decades of metal fabrication expertise with modern equipment and "
      "certified quality systems.",
  'MET INŽENJERING je etablirani proizvođač kotlova i pratećih konstrukcija za hidraulične agregate, koji snabdeva '
      'neke od vodećih svetskih imena u hidraulici. Od 2023. godine kompanija je proširila poslovanje na proizvodnju '
      'transformatorskih kotlova, spajajući višedecenijsko iskustvo u obradi metala sa modernom opremom i '
      'sertifikovanim sistemima kvaliteta.',
);

class StatData {
  final L10nText value;
  final L10nText label;
  final L10nText description;
  const StatData(this.value, this.label, this.description);
}

const List<StatData> aboutStats = [
  StatData(
    L10nText('€1,000,000', '1.000.000 €'),
    L10nText('Annual Production Value', 'Godišnja vrednost proizvodnje'),
    L10nText(
      'Covering tank capacities from 50 to 5,000 liters across hydraulic and transformer applications.',
      'Obuhvata kotlove zapremine od 50 do 5.000 litara, za hidrauličke i transformatorske primene.',
    ),
  ),
  StatData(
    L10nText('100+ units', '100+ jedinica'),
    L10nText('Transformer Tanks / Year', 'Transformatorskih kotlova godišnje'),
    L10nText(
      'Current annual capacity for transformer tanks weighing 5 to 16 tons each.',
      'Trenutni godišnji kapacitet za transformatorske kotlove mase od 5 do 16 tona.',
    ),
  ),
  StatData(
    L10nText('5,500+', '5.500+'),
    L10nText('Tons of Material in Stock', 'Tona materijala na lageru'),
    L10nText(
      'Metallurgical inventory ensuring short lead times and production flexibility.',
      'Metalurške zalihe koje obezbeđuju kratke rokove isporuke i fleksibilnost proizvodnje.',
    ),
  ),
];

class BulletListData {
  final L10nText title;
  final List<L10nText> items;
  const BulletListData(this.title, this.items);
}

// Capabilities
const capabilitiesCopy = SectionCopy(
  eyebrow: L10nText('Technological equipment & capabilities', 'Tehnološka oprema i mogućnosti'),
  title: L10nText(
    'Full in-house production,\nraw plate to finished tank',
    'Kompletna proizvodnja u sopstvenoj režiji,\nod sirove ploče do gotovog kotla',
  ),
  subtitle: L10nText(
    'MET INŽENJERING operates a comprehensive suite of metal forming, cutting, and machining equipment — enabling '
        'full in-house production from raw plate to finished, coated transformer tank.',
    'MET INŽENJERING raspolaže sveobuhvatnim setom opreme za oblikovanje, sečenje i obradu metala — što omogućava '
        'kompletnu proizvodnju u sopstvenoj režiji, od sirove ploče do gotovog, obojenog transformatorskog kotla.',
  ),
);

const cuttingTechnology = BulletListData(
  L10nText('Advanced Cutting Technology', 'Napredna tehnologija sečenja'),
  [
    L10nText('Fiber laser 15 kW — sheets up to 30 mm (2 × 6 m table)', 'Fiber laser 15 kW — limovi do 30 mm (sto 2 × 6 m)'),
    L10nText('Fiber laser 2 kW — sheets up to 12 mm (1.5 × 3 m table)', 'Fiber laser 2 kW — limovi do 12 mm (sto 1,5 × 3 m)'),
    L10nText('HP260A plasma cutting — sheets up to 40 mm', 'Plazma sečenje HP260A — limovi do 40 mm'),
    L10nText('Oxy-fuel cutting — sheets up to 200 mm', 'Autogeno (gasno) sečenje — limovi do 200 mm'),
    L10nText('CNC press 500 t — bending profiles up to 6 m', 'CNC presa 500 t — savijanje profila do 6 m'),
    L10nText('Shears — cutting sheets up to 15 mm thick', 'Giljotine — sečenje limova debljine do 15 mm'),
  ],
);

const machiningForming = BulletListData(
  L10nText('Machining & Forming', 'Mašinska obrada i oblikovanje'),
  [
    L10nText('Boring machines, lathes, and milling machines', 'Bušilice, strugovi i glodalice'),
    L10nText('Roll and drilling machines for structural work', 'Valjci i bušilice za konstruktivne radove'),
    L10nText('Band saws for bar and tool steel up to Ø 550 mm', 'Tračne testere za šipke i alatni čelik do Ø 550 mm'),
    L10nText(
      'Coil uncoiler and shears for sheets up to 6 mm, 1,500 mm wide',
      'Odmotavač koturova i makaze za limove do 6 mm, širine 1.500 mm',
    ),
  ],
);

// Facilities
const facilitiesCopy = SectionCopy(
  eyebrow: L10nText('Production facilities & capacity', 'Proizvodni pogoni i kapaciteti'),
  title: L10nText(
    'Two production halls,\nfull surface treatment on-site',
    'Dve proizvodne hale,\nkompletna obrada površina na licu mesta',
  ),
  subtitle: L10nText(
    'MET INŽENJERING operates two fully equipped production halls with dedicated surface treatment facilities, '
        'ensuring complete in-house manufacturing from steel plate to finished, coated transformer tank.',
    'MET INŽENJERING posluje u dve potpuno opremljene proizvodne hale sa posebnim postrojenjima za obradu '
        'površina, čime se obezbeđuje kompletna proizvodnja u sopstvenoj režiji, od čelične ploče do gotovog, '
        'obojenog transformatorskog kotla.',
  ),
);

const productionFacilities = BulletListData(
  L10nText('Production Facilities', 'Proizvodni pogoni'),
  [
    L10nText('Workshop 1 — 20 welding stations, 2 × 5 t cranes', 'Hala 1 — 20 zavarivačkih mesta, 2 × 5 t dizalice'),
    L10nText(
      'Workshop 2 — 20 welding stations, 2 cranes (8+8 t and 5+16 t)',
      'Hala 2 — 20 zavarivačkih mesta, 2 dizalice (8+8 t i 5+16 t)',
    ),
    L10nText('Preparation & drying rooms for workpiece conditioning', 'Prostorije za pripremu i sušenje radnih komada'),
    L10nText('Assembly area for final fitting and inspection', 'Prostor za montažu, završno sklapanje i kontrolu'),
  ],
);

const surfaceTreatmentRooms = BulletListData(
  L10nText('Surface Treatment Rooms', 'Prostorije za obradu površina'),
  [
    L10nText('Paint Shop 1 — 6.7 m × 9.6 m × 4.4 m (W × L × H)', 'Lakirnica 1 — 6,7 m × 9,6 m × 4,4 m (Š × D × V)'),
    L10nText('Paint Shop 2 — 4.0 m × 12.0 m × 3.0 m (W × L × H)', 'Lakirnica 2 — 4,0 m × 12,0 m × 3,0 m (Š × D × V)'),
    L10nText('Paint Shop 3 — 4.0 m × 10.0 m × 3.0 m (W × L × H)', 'Lakirnica 3 — 4,0 m × 10,0 m × 3,0 m (Š × D × V)'),
    L10nText(
      'Sandblasting Room — 4.7 m × 7.7 m × 5.0 m (W × L × H)',
      'Prostorija za peskarenje — 4,7 m × 7,7 m × 5,0 m (Š × D × V)',
    ),
  ],
);

const facilitiesHighlight = L10nText(
  '40 total welding stations across both halls — with heavy-lift crane capacity up to 16 tons, enabling full '
      'in-house production of the largest transformer tanks',
  'Ukupno 40 zavarivačkih mesta u obe hale — sa kapacitetom dizalica za teške terete do 16 tona, što omogućava '
      'kompletnu proizvodnju najvećih transformatorskih kotlova u sopstvenoj režiji',
);

// Products
const productsCopy = SectionCopy(
  eyebrow: L10nText('Product range', 'Asortiman proizvoda'),
  title: L10nText('A wide spectrum of\nmetal structures', 'Širok spektar\nmetalnih konstrukcija'),
  subtitle: L10nText(
    'Production facilities in Kula and Novi Sad cover a wide spectrum of metal structures for domestic and '
        'international clients. Complete in-house surface treatment ensures every product meets corrosion '
        'protection standards.',
    'Proizvodni pogoni u Kuli i Novom Sadu pokrivaju širok spektar metalnih konstrukcija za domaće i međunarodne '
        'klijente. Kompletna obrada površina u sopstvenoj režiji obezbeđuje da svaki proizvod ispunjava standarde '
        'antikorozivne zaštite.',
  ),
);

class ProductData {
  final IconData icon;
  final L10nText title;
  final L10nText description;
  const ProductData(this.icon, this.title, this.description);
}

const List<ProductData> products = [
  ProductData(
    Icons.electrical_services_outlined,
    L10nText('Steel Transformer Tanks', 'Čelični transformatorski kotlovi'),
    L10nText(
      'Custom-engineered tanks from 5 to 16 tons, manufactured to client specifications with full weld certification.',
      'Kotlovi izrađeni po meri, mase od 5 do 16 tona, proizvedeni prema specifikacijama klijenta uz punu '
          'sertifikaciju zavarenih spojeva.',
    ),
  ),
  ProductData(
    Icons.warehouse_outlined,
    L10nText('Silos & Industrial Structures', 'Silosi i industrijske konstrukcije'),
    L10nText(
      'Silos of various capacities, steel constructions for industrial halls, metal melting furnaces, and grain '
          'transport systems.',
      'Silosi različitih kapaciteta, čelične konstrukcije za industrijske hale, peći za topljenje metala i sistemi '
          'za transport žitarica.',
    ),
  ),
  ProductData(
    Icons.inventory_2_outlined,
    L10nText('Containers', 'Kontejneri'),
    L10nText(
      'Steel containers, ventilation systems, cyclones, fences, gates, and advertising billboards for diverse applications.',
      'Čelični kontejneri, ventilacioni sistemi, cikloni, ograde, kapije i reklamni bilbordi za razne namene.',
    ),
  ),
  ProductData(
    Icons.format_paint_outlined,
    L10nText('Surface Preparation & Coating', 'Priprema i zaštita površina'),
    L10nText(
      'Sandblasting to Sa 2.5, primer and top coating to RAL standards — complete surface protection in-house.',
      'Peskarenje do stepena Sa 2,5, osnovni i završni premaz prema RAL standardima — kompletna zaštita površina u '
          'sopstvenoj režiji.',
    ),
  ),
];

// Partners
const partnersCopy = SectionCopy(
  eyebrow: L10nText('Strategic partners & clients', 'Strateški partneri i klijenti'),
  title: L10nText('Trusted by global\nindustrial names', 'Poverenje globalnih\nindustrijskih imena'),
  subtitle: L10nText(
    'Met Inženjering collaborates with globally recognized industrial companies, serving as a reliable '
        'manufacturing and supply partner for complex projects across Europe.',
    'Met Inženjering sarađuje sa globalno prepoznatim industrijskim kompanijama, kao pouzdan proizvodni i '
        'snabdevački partner za kompleksne projekte širom Evrope.',
  ),
);

class PartnerData {
  final L10nText name;
  final L10nText description;
  const PartnerData(this.name, this.description);
}

const List<PartnerData> partners = [
  PartnerData(
    L10nText('Comel', 'Comel'),
    L10nText(
      'Regional transformer manufacturing and overhaul specialist, supplying electrical equipment and industrial '
          'control solutions. Hands-on experience in transformer production and servicing makes Comel a valuable '
          'partner for joint projects, aftermarket service, or co-production.',
      'Regionalni specijalista za proizvodnju i remont transformatora, koji snabdeva električnom opremom i '
          'industrijskim upravljačkim rešenjima. Praktično iskustvo u proizvodnji i servisiranju transformatora čini '
          'Comel vrednim partnerom za zajedničke projekte, postprodajni servis ili kooperativnu proizvodnju.',
    ),
  ),
  PartnerData(
    L10nText('Parker Hannifin (Germany)', 'Parker Hannifin (Nemačka)'),
    L10nText(
      'Global leader in precision components and systems for aerospace, mobile, and industrial markets — '
          'hydraulics, pneumatics, filtration, and motion control. A strong global supply chain partner with deep '
          'engineering expertise, ideal for complex industrial projects.',
      'Globalni lider u preciznim komponentama i sistemima za vazduhoplovno, mobilno i industrijsko tržište — '
          'hidraulika, pneumatika, filtracija i upravljanje kretanjem. Snažan globalni partner u lancu snabdevanja '
          'sa dubokom inženjerskom ekspertizom, idealan za kompleksne industrijske projekte.',
    ),
  ),
  PartnerData(
    L10nText('Lohr Group (France)', 'Lohr Group (Francuska)'),
    L10nText(
      "Designer and manufacturer of specialized transport and logistics systems with presence on multiple "
          "continents. Lohr's expertise in heavy and oversized transport solutions is highly relevant for logistics "
          "and special handling of transformer tanks.",
      'Projektant i proizvođač specijalizovanih transportnih i logističkih sistema, prisutan na više kontinenata. '
          'Lohr-ova ekspertiza u rešenjima za transport teških i vangabaritnih tereta veoma je značajna za logistiku '
          'i posebno rukovanje transformatorskim kotlovima.',
    ),
  ),
];

// Technical details
const technicalDetailsCopy = SectionCopy(
  eyebrow: L10nText('Critical technical details', 'Ključni tehnički detalji'),
  title: L10nText(
    'Precision welding,\nCNC-driven consistency',
    'Precizno zavarivanje,\ndoslednost zahvaljujući CNC tehnologiji',
  ),
);

const weldingMethodsHeading = L10nText('Welding methods', 'Metode zavarivanja');

class WeldingMethodData {
  final L10nText name;
  final L10nText description;
  const WeldingMethodData(this.name, this.description);
}

const List<WeldingMethodData> weldingMethods = [
  WeldingMethodData(
    L10nText('MIG/MAG welding', 'MIG/MAG zavarivanje'),
    L10nText(
      'Fast, economical, ideal for serial transformer tank production across various metals and thicknesses',
      'Brzo, ekonomično, idealno za serijsku proizvodnju transformatorskih kotlova kod različitih metala i debljina',
    ),
  ),
  WeldingMethodData(
    L10nText('TIG welding', 'TIG zavarivanje'),
    L10nText(
      'High precision and flawless weld appearance for thinner materials and special alloys',
      'Visoka preciznost i besprekoran izgled zavara za tanje materijale i specijalne legure',
    ),
  ),
  WeldingMethodData(
    L10nText('MMA (Manual Metal Arc)', 'MMA (ručno elektrolučno zavarivanje)'),
    L10nText(
      'Versatile manual welding for structural and repair applications',
      'Svestrano ručno zavarivanje za konstruktivne i reparaturne primene',
    ),
  ),
];

class FeatureTileData {
  final IconData icon;
  final L10nText title;
  final L10nText description;
  const FeatureTileData(this.icon, this.title, this.description);
}

const List<FeatureTileData> technicalFeatures = [
  FeatureTileData(
    Icons.precision_manufacturing_outlined,
    L10nText('CNC Technology', 'CNC tehnologija'),
    L10nText('Precision bending, cutting, and machining for tight tolerances.', 'Precizno savijanje, sečenje i obrada za uske tolerancije.'),
  ),
  FeatureTileData(
    Icons.tune_outlined,
    L10nText('Production Flexibility', 'Fleksibilnost proizvodnje'),
    L10nText(
      'Quick adaptation for small and medium series with scalability for larger batches.',
      'Brzo prilagođavanje malim i srednjim serijama, uz mogućnost skaliranja za veće serije.',
    ),
  ),
  FeatureTileData(
    Icons.build_circle_outlined,
    L10nText('State-of-the-Art Equipment', 'Vrhunska oprema'),
    L10nText(
      'Presses, lasers, and metalworking tools ensuring efficiency and quality.',
      'Prese, laseri i alati za obradu metala koji obezbeđuju efikasnost i kvalitet.',
    ),
  ),
];

// Quality control
const qualityCopy = SectionCopy(
  eyebrow: L10nText('Quality control', 'Kontrola kvaliteta'),
  title: L10nText('Quality integrated at\nevery stage of production', 'Kvalitet ugrađen u\nsvaku fazu proizvodnje'),
  subtitle: L10nText(
    'All products undergo strict control in accordance with ISO 9001, ensuring stable, safe, and '
        'specification-compliant transformer tanks at every delivery.',
    'Svi proizvodi prolaze strogu kontrolu u skladu sa standardom ISO 9001, čime se obezbeđuju stabilni, bezbedni '
        'transformatorski kotlovi usklađeni sa specifikacijama pri svakoj isporuci.',
  ),
);

class QualityStepData {
  final String number;
  final L10nText title;
  final L10nText description;
  const QualityStepData(this.number, this.title, this.description);
}

const List<QualityStepData> qualitySteps = [
  QualityStepData(
    '01',
    L10nText('Incoming Material Inspection', 'Ulazna kontrola materijala'),
    L10nText(
      "Detailed mechanical materials verified with manufacturer's certificates. Full compliance with technical "
          "documentation and customer requirements before production begins.",
      'Detaljna provera mehaničkih svojstava materijala uz proizvođačke sertifikate. Puna usklađenost sa tehničkom '
          'dokumentacijom i zahtevima kupca pre početka proizvodnje.',
    ),
  ),
  QualityStepData(
    '02',
    L10nText('In-Process Inspection', 'Kontrola tokom procesa proizvodnje'),
    L10nText(
      'Continuous monitoring of dimensions, tolerances, and welding parameters throughout the entire production '
          'cycle to catch deviations early.',
      'Kontinuirano praćenje dimenzija, tolerancija i parametara zavarivanja tokom celog proizvodnog ciklusa radi '
          'ranog otkrivanja odstupanja.',
    ),
  ),
  QualityStepData(
    '03',
    L10nText('Weld Inspection — Penetrant Testing (PT)', 'Kontrola zavarenih spojeva — Penetrantsko ispitivanje (PT)'),
    L10nText(
      'Detection of surface cracks and imperfections in all welds. Performed by trained and certified personnel '
          'in accordance with ISO 3834-3.',
      'Otkrivanje površinskih prslina i nepravilnosti na svim zavarenim spojevima. Sprovodi obučeno i sertifikovano '
          'osoblje u skladu sa ISO 3834-3.',
    ),
  ),
  QualityStepData(
    '04',
    L10nText('Final Inspection & Painting Control', 'Završna kontrola i kontrola farbanja'),
    L10nText(
      'Measurement of coating thickness, visual and functional inspection of each finished transformer tank '
          'before delivery and dispatch.',
      'Merenje debljine premaza, vizuelna i funkcionalna kontrola svakog gotovog transformatorskog kotla pre '
          'isporuke i otpreme.',
    ),
  ),
];

// Logistics
const logisticsCopy = SectionCopy(
  eyebrow: L10nText('Surface protection, packaging & logistics', 'Zaštita površina, pakovanje i logistika'),
  title: L10nText('From sandblasting\nto secure delivery', 'Od peskarenja\ndo bezbedne isporuke'),
);

const surfacePrepHeading = L10nText(
  'High-Standard Surface Preparation & Finishing',
  'Priprema i završna obrada površina visokog standarda',
);

const List<L10nText> surfacePrepPoints = [
  L10nText(
    'Mechanical and chemical cleaning — removal of grease, edges, and impurities prior to sandblasting',
    'Mehaničko i hemijsko čišćenje — uklanjanje masnoća, oštrih ivica i nečistoća pre peskarenja',
  ),
  L10nText(
    'Advanced sandblasting achieving surface roughness Sa 2.5 per ISO 8501-1',
    'Napredno peskarenje kojim se postiže hrapavost površine Sa 2,5 prema ISO 8501-1',
  ),
  L10nText(
    'Primer, intermediate, and top coatings applied per customer RAL specifications',
    'Osnovni, međuslojni i završni premaz nanose se prema RAL specifikacijama kupca',
  ),
  L10nText(
    'Coating thickness measured at each stage for full compliance',
    'Debljina premaza se meri u svakoj fazi radi potpune usklađenosti',
  ),
];

const logisticsHeading = L10nText('Organized Logistics & Secure Packaging', 'Organizovana logistika i bezbedno pakovanje');

const List<L10nText> logisticsPoints = [
  L10nText(
    'Modular delivery — transformer tanks shipped as separate functional components (housing, conservators, '
        'tubes, mounting plates) for easier transport and on-site assembly',
    'Modularna isporuka — transformatorski kotlovi se otpremaju kao odvojene funkcionalne komponente (kotao, '
        'konzervatori, cevi, montažne ploče) radi lakšeg transporta i montaže na licu mesta',
  ),
  L10nText(
    'Safe packaging — each component securely fixed and protected, with emphasis on surface and weld protection '
        'during transit',
    'Bezbedno pakovanje — svaka komponenta je čvrsto fiksirana i zaštićena, sa posebnim naglaskom na zaštitu '
        'površine i zavara tokom transporta',
  ),
  L10nText(
    'Own specialized vehicles — dedicated trucks for oversized and heavy loads, ensuring full control over '
        'deadlines and transport safety',
    'Sopstvena specijalizovana vozila — namenski kamioni za vangabaritne i teške terete, čime se obezbeđuje '
        'potpuna kontrola rokova i bezbednosti transporta',
  ),
];

// Ada facility
const adaCopy = SectionCopy(
  eyebrow: L10nText('Production facility — Ada', 'Proizvodni pogon — Ada'),
  title: L10nText('60 km from the main\nplant in Kula', '60 km od glavnog\npogona u Kuli'),
  subtitle: L10nText(
    "Met Inženjering's Ada facility is a significant expansion, offering substantial capabilities for large-scale "
        "manufacturing projects. The facility features truck-accessible entrances suitable for full trailer "
        "movement, ensuring efficient logistics.",
    'Pogon Met Inženjeringa u Adi predstavlja značajno proširenje, sa velikim mogućnostima za projekte proizvodnje '
        'velikog obima. Pogon poseduje ulaze pristupačne kamionima, pogodne za kretanje punih šlepera, čime se '
        'obezbeđuje efikasna logistika.',
  ),
);

const adaOwnershipTitle = L10nText('Ownership & Status', 'Vlasništvo i status');
const adaOwnershipBody = L10nText(
  'The facility is owned by our company and has been fully acquired. Additional investment in equipment is '
      'required to reach full production capacity.',
  'Pogon je u vlasništvu naše kompanije i u potpunosti je otkupljen. Za dostizanje punog proizvodnog kapaciteta '
      'potrebna su dodatna ulaganja u opremu.',
);

const adaStrategicTitle = L10nText('Strategic Potential', 'Strateški potencijal');
const adaStrategicBody = L10nText(
  'The site offers an excellent opportunity for developing a large-scale transformer tank manufacturing plant. '
      'Realization of such an investment is contingent upon securing a substantial volume of transformer tank orders.',
  'Lokacija pruža odličnu priliku za razvoj pogona za proizvodnju transformatorskih kotlova velikog obima. '
      'Realizacija ovakve investicije zavisi od obezbeđivanja značajnog obima porudžbina za transformatorske kotlove.',
);

const List<StatData> adaStats = [
  StatData(L10nText('459,188', '459.188'), L10nText('Complex Area', 'Površina kompleksa'), L10nText('ft² total', 'ukupno ft²')),
  StatData(L10nText('167,712', '167.712'), L10nText('Production Hall', 'Proizvodna hala'), L10nText('ft² total', 'ukupno ft²')),
  StatData(L10nText('49', '49'), L10nText('Building Height', 'Visina objekta'), L10nText('Feet max', 'maks. stopa')),
  StatData(L10nText('9', '9'), L10nText('Overhead Cranes', 'Mosne dizalice'), L10nText('installed', 'instalirano')),
];

// Production showcase
const productionShowcaseCopy = SectionCopy(
  eyebrow: L10nText('Production — Transformer tanks', 'Proizvodnja — Transformatorski kotlovi'),
  title: L10nText('Built to exact\nengineering specification', 'Izrađeno prema tačnoj\ninženjerskoj specifikaciji'),
);

const tankName = L10nText('100 MVA Transformer Tank', 'Transformatorski kotao 100 MVA');

class TankSpecData {
  final L10nText label;
  final L10nText value;
  const TankSpecData(this.label, this.value);
}

const List<TankSpecData> tankSpecs = [
  TankSpecData(L10nText('Length', 'Dužina'), L10nText('6,528 mm', '6.528 mm')),
  TankSpecData(L10nText('Width', 'Širina'), L10nText('2,478 mm', '2.478 mm')),
  TankSpecData(L10nText('Height', 'Visina'), L10nText('3,860 mm', '3.860 mm')),
  TankSpecData(L10nText('Total weight', 'Ukupna masa'), L10nText('17 t', '17 t')),
  TankSpecData(L10nText('Conservator', 'Konzervator'), L10nText('Ø 1,266 mm × 3,424 mm', 'Ø 1.266 mm × 3.424 mm')),
];

// Metallurgy
const metallurgyCopy = SectionCopy(
  eyebrow: L10nText('Metallurgy', 'Metalurgija'),
  title: L10nText('A well-stocked, well-\nequipped material yard', 'Dobro snabdeveno i\ndobro opremljeno skladište materijala'),
);

// Contact
const contactCopy = SectionCopy(
  eyebrow: L10nText('Contact us', 'Kontaktirajte nas'),
  title: L10nText(
    "Let's talk about your\ntransformer tank project",
    'Razgovarajmo o vašem\nprojektu transformatorskog kotla',
  ),
  subtitle: L10nText(
    'Ready to discuss your transformer tank requirements? Our engineering and sales team is available to provide '
        'quotes, technical consultations, and production timelines tailored to your project needs.',
    'Spremni ste da razgovarate o zahtevima za transformatorski kotao? Naš inženjerski i prodajni tim vam stoji na '
        'raspolaganju za ponude, tehničke konsultacije i rokove proizvodnje prilagođene potrebama vašeg projekta.',
  ),
);

// Contact form
const contactFormTitle = L10nText('Send us a message', 'Pošaljite nam poruku');
const contactFormEmailLabel = L10nText('Your email', 'Vaša email adresa');
const contactFormEmailHint = L10nText('you@example.com', 'vi@primer.com');
const contactFormMessageLabel = L10nText('Message', 'Poruka');
const contactFormMessageHint = L10nText(
  'Tell us about your project...',
  'Recite nam nešto o vašem projektu...',
);
const contactFormSendLabel = L10nText('Send Message', 'Pošaljite poruku');
const contactFormEmailError = L10nText('Please enter a valid email address', 'Unesite ispravnu email adresu');
const contactFormMessageError = L10nText('Please enter a message', 'Unesite poruku');
const contactFormSendingLabel = L10nText('Sending...', 'Slanje...');
const contactFormSuccessMessage = L10nText(
  'Message sent — we will get back to you soon.',
  'Poruka je poslata — javićemo vam se uskoro.',
);
const contactFormSendAnotherLabel = L10nText('Send another message', 'Pošaljite još jednu poruku');
const contactFormErrorMessage = L10nText(
  'Something went wrong. Please try again later.',
  'Došlo je do greške. Pokušajte ponovo kasnije.',
);

class ContactData {
  final IconData icon;
  final String id;
  final L10nText label;
  final L10nText value;
  const ContactData(this.icon, this.id, this.label, this.value);
}

const List<ContactData> contactItems = [
  ContactData(
    Icons.public,
    'website',
    L10nText('Parent Company Website', 'Sajt matične kompanije'),
    L10nText('www.metalopromet.rs', 'www.metalopromet.rs'),
  ),
  ContactData(
    Icons.call_outlined,
    'phone',
    L10nText('Phone', 'Telefon'),
    L10nText('+381 (0)62-802-3936', '+381 (0)62-802-3936'),
  ),
  ContactData(
    Icons.mail_outline,
    'email',
    L10nText('Email', 'Email'),
    L10nText('info@metinzenjering.rs', 'info@metinzenjering.rs'), // placeholder, replace with real email
  ),
  ContactData(
    Icons.location_on_outlined,
    'location',
    L10nText('Location', 'Lokacija'),
    L10nText('Novi Sad & Kula, Serbia', 'Novi Sad i Kula, Srbija'),
  ),
];

const isoBadges = ['ISO 9001', 'ISO 14001', 'ISO 3834-3'];

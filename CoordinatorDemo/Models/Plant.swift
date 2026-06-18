//
//  Plant.swift
//  CoordinatorDemo
//
//  Created by Daniel Serrano on 28/05/26.
//

import Foundation

struct Plant: Identifiable, Hashable {
    let id: UUID
    let name: String
    let image: String
    let description: String
    let care: String
    let registrationDate: Date
    let isFavorite: Bool
}

extension Plant {
    static let mocks: [Plant] = [
        Plant(
            id: UUID(),
            name: "Monstera Thai Constellation",
            image: "monstera_thai_constellation",
            description: "Una de las monsteras más codiciadas del mundo, con hojas grandes de color verde oscuro salpicadas de manchas crema y blancas que simulan una constelación.",
            care: "Riega cuando el primer centímetro de tierra esté seco. Luz indirecta brillante. Alta humedad. Evita el sol directo para preservar la variegación.",
            registrationDate: Date(timeIntervalSince1970: 1_700_000_000),
            isFavorite: true
        ),
        Plant(
            id: UUID(),
            name: "Monstera Adansonii",
            image: "monstera_adansonii",
            description: "Conocida como la monstera queso suizo, es una enredadera tropical con hojas ovaladas llenas de perforaciones naturales que le dan un aspecto único.",
            care: "Riega cada 1-2 semanas. Luz indirecta media a brillante. Alta humedad. Necesita soporte para trepar.",
            registrationDate: Date(timeIntervalSince1970: 1_710_000_000),
            isFavorite: true
        ),
        Plant(
            id: UUID(),
            name: "Philodendron Prince of Orange",
            image: "philodendron_prince_of_orange",
            description: "Filodendro compacto y llamativo cuyas hojas nuevas brotan en tonos naranja intenso y van madurando hacia el verde, creando un efecto multicolor espectacular.",
            care: "Riega cuando los primeros 3 cm de tierra estén secos. Luz indirecta brillante. Humedad moderada a alta. Evita el sol directo.",
            registrationDate: Date(timeIntervalSince1970: 1_720_000_000),
            isFavorite: true
        ),
        Plant(
            id: UUID(),
            name: "Anturio Dorayaki",
            image: "anturio_dorayaki",
            description: "Anturio de colección con hojas redondeadas y aterciopeladas de color verde oscuro con venas plateadas muy marcadas. Su forma recuerda al famoso pastel japonés que le da nombre.",
            care: "Riega cuando la tierra esté parcialmente seca. Luz indirecta media. Alta humedad. Evita el encharcamiento y las corrientes de aire frío.",
            registrationDate: Date(timeIntervalSince1970: 1_730_000_000),
            isFavorite: true
        ),
        Plant(
            id: UUID(),
            name: "Pothos Marble Queen",
            image: "pothos_marble_queen",
            description: "Variedad de pothos muy popular con hojas en forma de corazón de color verde con amplias manchas y rayas blancas cremosas que le dan un aspecto marmoleado elegante.",
            care: "Riega cada 1-2 semanas. Luz indirecta media a brillante. Muy tolerante y fácil de cuidar. Más luz favorece la variegación.",
            registrationDate: Date(timeIntervalSince1970: 1_740_000_000),
            isFavorite: false
        ),
        Plant(
            id: UUID(),
            name: "Begonia Maculata Pink",
            image: "begonia_maculata_pink",
            description: "Begonia de lunares con hojas alargadas de color verde oscuro decoradas con manchas plateadas en el haz y un reverso rojo intenso. Produce delicadas flores rosadas en racimos colgantes.",
            care: "Riega cuando los primeros 2 cm de tierra estén secos. Luz indirecta brillante. Humedad moderada. Evita mojar las hojas para prevenir hongos.",
            registrationDate: Date(timeIntervalSince1970: 1_750_000_000),
            isFavorite: true
        ),
        Plant(
            id: UUID(),
            name: "Tradescantia",
            image: "tradescantia",
            description: "Planta colgante de rápido crecimiento con hojas ovaladas en tonos morados, verdes y plateados según la variedad. Muy decorativa y fácil de propagar en agua.",
            care: "Riega cada 1-2 semanas. Luz indirecta brillante. Tolera condiciones variadas. Poda frecuente para mantener su forma compacta.",
            registrationDate: Date(timeIntervalSince1970: 1_760_000_000),
            isFavorite: false
        ),
        Plant(
            id: UUID(),
            name: "Alocasia Silver Dragon",
            image: "alocasia_silver_dragon",
            description: "Alocasia joya compacta con hojas gruesas y texturadas de color verde plateado con venas oscuras muy marcadas que le dan un aspecto escamado similar a las escamas de un dragón.",
            care: "Riega cuando los primeros 3 cm de tierra estén secos. Luz indirecta media. Alta humedad. Evita el encharcamiento y las temperaturas frías.",
            registrationDate: Date(timeIntervalSince1970: 1_770_000_000),
            isFavorite: false
        ),
        Plant(
            id: UUID(),
            name: "Cotyledon Tomentosa",
            image: "cotyledon_tomentosa",
            description: "Suculenta conocida como patas de oso por sus hojas carnosas y redondeadas cubiertas de finos pelillos blancos con puntas rojizas. Produce flores tubulares de color naranja en primavera.",
            care: "Riega con poca frecuencia, solo cuando la tierra esté completamente seca. Sol pleno o luz indirecta brillante. Tierra con excelente drenaje. Evita la humedad excesiva.",
            registrationDate: Date(timeIntervalSince1970: 1_780_000_000),
            isFavorite: false
        ),
        Plant(
            id: UUID(),
            name: "Sansevieria",
            image: "sansevieria",
            description: "Planta de interior extremadamente resistente con hojas erguidas y rígidas en tonos verdes con bordes amarillos o plateados. Reconocida por su capacidad de purificar el aire.",
            care: "Riega cada 2-6 semanas según la estación. Tolera luz baja, media e indirecta brillante. Tierra con buen drenaje. Muy tolerante al descuido.",
            registrationDate: Date(timeIntervalSince1970: 1_790_000_000),
            isFavorite: false
        ),
        Plant(
            id: UUID(),
            name: "Maranta Leuconeura",
            image: "maranta_leuconeura",
            description: "Conocida como planta de la oración por su curioso comportamiento de plegar las hojas hacia arriba al anochecer. Sus hojas ovaladas presentan un patrón simétrico de manchas verde oscuro y venas rojizas sobre un fondo verde claro.",
            care: "Riega cuando los primeros 2 cm de tierra estén secos. Luz indirecta baja a media. Alta humedad. Evita el agua con cloro y las corrientes de aire frío.",
            registrationDate: Date(timeIntervalSince1970: 1_800_000_000),
            isFavorite: false
        )
    ]

    static let wishListMocks: [Plant] = [
        Plant(
            id: UUID(),
            name: "Alocasia Zebrina",
            image: "alocasia_zebrina",
            description: "Planta tropical llamativa con grandes hojas en forma de flecha sobre tallos con patrón de cebra.",
            care: "Riega cuando el primer centímetro de tierra esté seco. Luz indirecta brillante. Alta humedad. Evita corrientes frías.",
            registrationDate: Date(timeIntervalSince1970: 1_701_000_000),
            isFavorite: false
        ),
        Plant(
            id: UUID(),
            name: "Alocasia Black Velvet",
            image: "alocasia_black_velvet",
            description: "Alocasia joya compacta con hojas oscuras y profundas con venas plateadas muy contrastantes.",
            care: "Riega con moderación. Luz indirecta brillante. Alta humedad. Tierra con buen drenaje.",
            registrationDate: Date(timeIntervalSince1970: 1_711_000_000),
            isFavorite: false
        ),
        Plant(
            id: UUID(),
            name: "Philodendron Pink Princess",
            image: "philodendron_pink_princess",
            description: "Filodendro muy codiciado con hojas verde oscuro salpicadas de variegación rosa.",
            care: "Riega cada 1-2 semanas. Luz indirecta brillante. Mantén la humedad por encima del 50%. Evita el sol directo.",
            registrationDate: Date(timeIntervalSince1970: 1_721_000_000),
            isFavorite: false
        ),
        Plant(
            id: UUID(),
            name: "Philodendron Gloriosum",
            image: "philodendron_gloriosum",
            description: "Filodendro rastrero poco común con grandes hojas aterciopeladas en forma de corazón y venas blancas.",
            care: "Riega cuando los primeros 5 cm de tierra estén secos. Luz indirecta. Alta humedad. Tierra rica con buen drenaje.",
            registrationDate: Date(timeIntervalSince1970: 1_731_000_000),
            isFavorite: false
        ),
        Plant(
            id: UUID(),
            name: "Alocasia Frydek",
            image: "alocasia_frydek",
            description: "Conocida como la Alocasia Terciopelo Verde, tiene hojas aterciopeladas verde oscuro con venas blancas.",
            care: "Riega regularmente pero evita el encharcamiento. Luz indirecta brillante. Alta humedad. Temperaturas cálidas.",
            registrationDate: Date(timeIntervalSince1970: 1_741_000_000),
            isFavorite: false
        )
    ]

    static let nativePlantsMocks: [Plant] = [
        Plant(
            id: UUID(),
            name: "Agave",
            image: "agave",
            description: "Suculenta icónica mexicana con hojas gruesas y carnosas terminadas en espinas afiladas. Usada por siglos para producir pulque, mezcal y tequila.",
            care: "Riega con poca frecuencia. Sol pleno. Tierra arenosa con buen drenaje. Extremadamente resistente a la sequía.",
            registrationDate: Date(timeIntervalSince1970: 1_702_000_000),
            isFavorite: false
        ),
        Plant(
            id: UUID(),
            name: "Cempasúchil",
            image: "cempasuchil",
            description: "El icónico cempasúchil mexicano con flores vibrantes en naranja y amarillo, usado tradicionalmente para decorar altares en el Día de Muertos.",
            care: "Riega regularmente. Sol pleno. Tierra con buen drenaje. Florece en otoño.",
            registrationDate: Date(timeIntervalSince1970: 1_712_000_000),
            isFavorite: false
        ),
        Plant(
            id: UUID(),
            name: "Dalia",
            image: "dalia",
            description: "La flor nacional de México, disponible en cientos de variedades con flores impresionantes que van del blanco al morado intenso.",
            care: "Riega con frecuencia. Sol pleno a semisombra. Tierra rica con buen drenaje. Tutora las variedades altas.",
            registrationDate: Date(timeIntervalSince1970: 1_722_000_000),
            isFavorite: false
        ),
        Plant(
            id: UUID(),
            name: "Nochebuena",
            image: "nochebuena",
            description: "Conocida mundialmente como Poinsettia, esta planta nativa mexicana es famosa por sus brácteas rojas que florecen en Navidad.",
            care: "Riega cuando la tierra esté seca. Luz indirecta brillante. Evita corrientes frías. Reduce el riego tras la floración.",
            registrationDate: Date(timeIntervalSince1970: 1_732_000_000),
            isFavorite: false
        ),
        Plant(
            id: UUID(),
            name: "Salvia Mexicana",
            image: "salvia_mexicana",
            description: "Salvia nativa mexicana con llamativas flores azul-morado intenso que atraen colibríes y polinizadores.",
            care: "Riega con moderación. Sol pleno a semisombra. Tierra con buen drenaje. Poda tras la floración.",
            registrationDate: Date(timeIntervalSince1970: 1_742_000_000),
            isFavorite: false
        )
    ]
}

# CM
Cameroonian [AFA Codes](https://AFA.codes), officially incorporated as **BANOC** - *Base d'Adresses Numérique Ouverte du Cameroun*.

This repository is used as "public part" of the *AFAcodes_gridGen-CM* configurations.
The source-code of the software *AfaCodes_gridGen-CM* will be generated here (under a `src` folder) by the *AFAcodes-softwareGen* &mdash; the software-generator system, which generates the "AFA Codes System" software for different countries. Both software were registered with [INPI](https://www.gov.br/inpi).

The `data-CC0` folder has [CC0 licensed](https://creativecommons.org/public-domain/cc0/) data. The `data-licensed` folder has [other Creative Commons license](https://en.wikipedia.org/wiki/Creative_Commons_license).

When the [`src` folder is present](src), the licenses and instructions present in the folder must be used.

## Nominal geocodes of CM

To Cameroon was assigned: in the [ISO&nbsp;3166](https://en.wikipedia.org/wiki/ISO_3166) context the geocode [**CM**](https://en.wikipedia.org/wiki/ISO_3166-2:CM) and the number [**120**](https://en.wikipedia.org/wiki/ISO_3166-1_numeric). Other considered geocodes: at [Wikidata](https://wikidata.org) the identifier [Q1009](http://wikidata.org/entity/Q1009); at [OpenStreetMap](https://osm.org) the [*relation* id 192830](http://osm.org/relation/192830).

For administrative organization, the national territory and its subdivisions represent *jurisdictions*:

* The country is divided into *10 regions* (then-provinces), semi-autonomous, that are headed by a governor appointed by the president of the republic.
The geocodes of the regions follow the convention registered by [ISO&nbsp;3166&#8209;2:CM](https://en.wikipedia.org/wiki/ISO_3166-2:CM). In OpenStreetMap it is agreed that the subdivision by regions corresponds to administrative level 4.

* The regions are subdivided into *departments*, communes (_arrondissements_) and  districts. There are a total of **360 subdivisions** used as ISO&nbsp;3166&#8209;2:CM's third level subdivision.<br/>They are listed as official "extended ISO labels" at [`data-restricted/citycover.csv`](data-restricted/citycover.csv) (column `isolabel_ext`), forming an [hierarchical naming geocode system](https://en.wikipedia.org/wiki/Geocode#Hierarchical_naming), under the syntax `CM-$L2-$L3`. The codes of the form `CM-$L2` are the provinces, `$L3` are expressed as CamelCase ASCII transcription of the complete name without accents or separators. Exemples: `CM-SU-KyeOssi` as Kyé-Ossi, `CM-CE-Soa` as Soa, `CM-SU-Maan` as Ma'an.

## Grid-system geocodes

[Geocodes based on regular hierarchical grids](https://en.wikipedia.org/wiki/Geocode#Hierarchical_grids) can be encoded/decoded from Latitude-Longitude coordinates. They are provided for in the [DNGS standard - Discrete National Grid Systems](https://inde.gov.br/simposio-16-anos/), a variation of the [ISO DGGS standard](https://www.iso.org/standard/32588.html) for national (instead global) requirements.

Grid AFA Codes adhere to the DNGS standard, and for Cameroon they are defined in the `afaCode_definition` parameter, at [`conf.yaml` configuration file](conf.yaml). The grid system uses refinement ratio 2, in the process of subdividing parent cells into descendant child cells. The process starts with 16 squares with sides of 262.144 km, covering the Cameroon territory, as showed bellow. As "power of 2" codes, they are expressed by hexadecimal-like codes (*base 16h* representation).

![](data-CC0/gridCover-illustrated1.png)


Long grid-based geocodes can be [shortened  by context](https://en.wikipedia.org/wiki/Geocode#Shortening_grid-based_codes_by_context). DNGS suggest the nominal geocodes as context, and, to be easy to remember for humans, adopt the most compact [base 32](https://en.wikipedia.org/wiki/Base32) representation. The resulting notation is called "logistic geocode", and its definition-sources are into the files [`citycover.csv`](data-restricted/citycover.csv),  [`citycover_dust.csv`](data-restricted/citycover_dust.csv) and [`citycover_dustDEL.csv`](data-restricted/citycover_dustDEL.csv) at `data-restricted` folder.

## Extended Geo URI

... All "official geocodes" can be used with the [Extended Geo URI](https://afa.codes/_foundations/2sbide_poster-GeoURI-v2.pdf) protocol (described at [page 140 here](https://inde.gov.br/images/inde/ANAIS_2SBIDE.pdf)) ...

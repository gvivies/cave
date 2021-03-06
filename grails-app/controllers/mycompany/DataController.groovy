package mycompany

import mycompany.Authority
import mycompany.UserAuthority
import mycompany.Region

class DataController {

	/**
	 * Dependency injection for Spring security service
	 */
	def springSecurityService

	static void initSecurity() {

		/* Bootstrapping admin user and roles */
		def adminAuthInstance = Authority.get(1)
		if (!adminAuthInstance) adminAuthInstance = new Authority(id: 1, authority: 'ROLE_ADMIN', description: 'Admin role').save()
		
		def userAuthInstance = Authority.get(2)
		if (!userAuthInstance) userAuthInstance = new Authority(id: 2, authority: 'ROLE_USER', description: 'User role').save()
		
		def admin = new User(username: 'admin', realname: 'Admin', password:'admin', enabled: true, email: '').save()
		
		UserAuthority.create admin, adminAuthInstance, true
	}

	static void initForUser(String owner) {

		initDealer(owner)
		initRegions(owner)

		def bordeaux = Region.findByNameAndOwnerId('Bordeaux', owner)
		initAppellationsBordeaux(bordeaux, owner)

		def alsace = Region.findByNameAndOwnerId('Alsace', owner)
		initAppellationsAlsace(alsace, owner)

		def bourgogne = Region.findByNameAndOwnerId('Bourgogne', owner)
		initAppellationsBourgogne(bourgogne, owner)

		def sudouest = Region.findByNameAndOwnerId('Sud-Ouest', owner)
		initAppellationsSudOuest(sudouest, owner)

		def loire = Region.findByNameAndOwnerId('Loire', owner)
		initAppellationsLoire(loire, owner)
		
		def champagne = Region.findByNameAndOwnerId('Champagne', owner)
		initAppellationsChampagne(champagne, owner)
		
		def cotesdurhone = Region.findByNameAndOwnerId('Côtes du Rhône', owner)
		initAppellationsCotesDuRhone(cotesdurhone, owner)
		
		def corse = Region.findByNameAndOwnerId('Corse', owner)
		initAppellationsCorse(corse, owner)
		
		def provence = Region.findByNameAndOwnerId('Provence', owner)
		initAppellationsProvence(provence, owner)
		
		def languedoc = Region.findByNameAndOwnerId('Languedoc-Roussillon', owner)
		initAppellationsLanguedoc(languedoc, owner)
	}

	static void initAppellationsLanguedoc(Region languedoc, String ownerId) {
		new Wine(region: languedoc, ownerId: ownerId, name: 'Côtes-Catalanes').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Côte-Vermeille').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Pyrénées-Orientales').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Collioure').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Côtes-du-Roussillon').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Côtes-du-Roussillon Les Aspres').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Côtes-du-Roussillon Villages').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Caramany').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Lesquerde').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Tautavel').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Latour-de-France').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Banyuls').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Banyuls Grand Cru').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Grand Roussillon').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Maury').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Muscat de Rivesaltes').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Rivesaltes').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Cabrières').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Clairette du Languedoc').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Faugères').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Grès-de-Montpellier').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'La Clape').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'La Méjanelle').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Montpeyroux').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Pézenas').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Picpoul de Pinet').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Pic-Saint-Loup').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Quatourze').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Saint-Chinian').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Saint-Christol').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Saint-Drézéry').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Saint-Georges-d\'orques').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Saint-Saturnin').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Terrasses-du-Larzac').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Sommières').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Vérargues').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Blanquette de Limoux').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Crémant de Limoux').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Limoux').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Cabardès').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Corbières').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Corbières-Boutenac').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Languedoc').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Fitou').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Minervois').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Minervois-la-Livinière').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Malepère').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Muscat de Frontignan').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Muscat de Mireval').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Muscat de Saint-Jean-de-Minervois').save()
		new Wine(region: languedoc, ownerId: ownerId, name: 'Muscat de Lune').save()
	}
	
	static void initAppellationsChampagne(Region champagne, String ownerId) {
		new Wine(region: champagne, ownerId: ownerId, name: 'Champagne').save()
		new Wine(region: champagne, ownerId: ownerId, name: 'Coteaux champenois').save()
		new Wine(region: champagne, ownerId: ownerId, name: 'Rosé des Riceys').save() 
	}
	
	static void initRegions(String owner) {
		new Region(name: 'Bordeaux', ownerId: owner).save()
		new Region(name: 'Bourgogne', ownerId: owner).save()
		new Region(name: 'Sud-Ouest', ownerId: owner).save()
		new Region(name: 'Loire', ownerId: owner).save()
		new Region(name: 'Alsace', ownerId: owner).save()
		new Region(name: 'Champagne', ownerId: owner).save()
		new Region(name: 'Côtes du Rhône', ownerId: owner).save()
		new Region(name: 'Corse', ownerId: owner).save()
		new Region(name: 'Provence', ownerId: owner).save()
		new Region(name: 'Languedoc-Roussillon', ownerId: owner).save()
	}

	static void initDealer(String owner) {
		new Dealer(name:'Non connu',street:'',city:'',zipCode:'',telephone:'',ownerId: owner).save()
	}

	static void initAppellationsBordeaux(Region bordeaux, String ownerId) {
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Médoc').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Haut-Médoc').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Saint-Estèphe').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Pauillac').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Saint-Julien').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Listrac-Médoc').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Moulis-en-Médoc').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Margaux').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Pessac-Léognan').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Graves-Supérieurs').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Graves').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Cérons').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Barsac').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Sauternes').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Entre-deux-mers').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Graves-de-vayres').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Premières-côtes-de-Bordeaux').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Cadillac').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Cadillac-côtes-de-Bordeaux').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Loupiac').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Sainte-Croix-du-Mont').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Bordeaux-Haut-Benauge').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Côtes-de-Bordeaux-Saint-Macaire').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Sainte-Foy-Bordeaux').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Fronsac').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Canon-Fronsac').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Pomerol').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Lalande-de-Pomerol').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Néac').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Saint-Emilion').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Montagne-Saint-Emilion').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Saint-georges-Saint-Emilion').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Lussac-Saint-Emilion').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Puisseguin-Saint-Emilion').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Francs-côtes-de-Bordeaux').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Castillon-côtes-de-Bordeaux').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Blaye').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Côtes-de-Blaye').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Blaye-côtes-de-Bordeaux').save()
		new Wine(region: bordeaux, ownerId: ownerId, name: 'Côtes-de-Bourg').save()
	}

	static void initAppellationsAlsace(Region alsace, String ownerId) {
		new Wine(region: alsace, ownerId: ownerId, name: 'Riesling').save()
		new Wine(region: alsace, ownerId: ownerId, name: 'Pinot-gris').save()
		new Wine(region: alsace, ownerId: ownerId, name: 'Gewurztraminer').save()
		new Wine(region: alsace, ownerId: ownerId, name: 'Muscat').save()
		new Wine(region: alsace, ownerId: ownerId, name: 'Pinot-noir').save()
		new Wine(region: alsace, ownerId: ownerId, name: 'Sylvaner').save()
		new Wine(region: alsace, ownerId: ownerId, name: 'Klevener de Heiligenstein').save()
		new Wine(region: alsace, ownerId: ownerId, name: 'Pinot').save()
		new Wine(region: alsace, ownerId: ownerId, name: 'Chasselas').save()
		new Wine(region: alsace, ownerId: ownerId, name: 'Edelzwicker').save()
	}

	static void initAppellationsBourgogne(Region bourgogne, String ownerId) {
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Petit-chablis').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Chablis').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Chablis Grand Cru').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Irancy').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Saint-Bris').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Côte-d’Auxerre').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Chitry').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Coulanges-La-Vineuse').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Tonnerre').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Epineuil').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Vézelay').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Côte-Saint-Jacques').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Montrecul').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Le-Chapitre').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Fixin').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Marsannay').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Gevrey-Chambertin').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Chambertin').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Chambertin-Clos-de-Bèze').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Chapelle-Chambertin').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Charmes-Chambertin').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Mazis-Chambertin').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Griotte-Chambertin').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Latricières-Chambertin').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Ruchottes-Chambertin').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Mazoyères-Chambertin').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Morey-Saint-Denis').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Clos-de-Tart').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Clos-Saint-Denis').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Clos-de-la-Roche').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Clos-des-Lambrays').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Chambolle-Musigny').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Musigny').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Bonnes-Mares').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Vougeot').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Clos-Vougeot').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Echezeaux').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Grands-Echezeaux').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Vosne-Romanée').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Romanée-Conti').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Richebourg').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'La-Romanée').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'La-Tâche').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Romanée-Saint-Vivant').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'La-Grande-Rue').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Nuits-Saint-Georges').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Côte-de-Nuits-Villages').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Hautes-Côtes-de-Nuits').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Ladoix').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'La-Chapelle-Notre-Dame').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Aloxe-Corton').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Corton').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Corton-Charlemagne').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Charlemagne').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Chorey-Lès-Beaune').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Savigny-Lès-Beaune').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Pernand-Vergelesses').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Beaune').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Côte-de-Beaune').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Pommard').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Volnay').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Meursault').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Auxey-Duresses').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Monthélie').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Puligny-Montrachet').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Chevalier-Montrachet').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Bienvenues-Bâtard-Montrachet').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Montrachet').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Bâtard-Montrachet').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Chassagne-Montrachet').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Criots-Bâtard-Montrachet').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Saint-Aubin').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Saint-Romain').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Blagny').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Santenay').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Maranges').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Côte-de-Beaune-Villages').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Hautes-Côtes-de-Beaune').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Bouzeron').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Rully').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Mercurey').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Givry').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Montagny').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Côte-Chalonnaise').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Côtes-du-Couchois').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Pouilly-Fuissé').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Pouilly-Vinzelles').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Pouilly-Loché').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Saint-véran').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Viré-clessé').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Mâcon').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Mâcon-villages').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Bourgogne').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Bourgogne-aligoté').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Bourgogne-Passe-Tout-Grains').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Coteaux-Bourguignons').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Crémant de Bourgogne').save()
		new Wine(region: bourgogne, ownerId: ownerId, name: 'Bourgogne-Mousseux').save()
	}

	static void initAppellationsSudOuest(Region sudouest, String ownerId) {
		new Wine(region: sudouest, ownerId: ownerId, name: 'Bergeracois	Bergerac').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Côtes-de-Bergerac').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Montravel').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Haut-Montravel').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Côtes-de-Montravel').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Monbazillac').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Pécharmant').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Rosette').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Saussignac').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Périgord').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Côtes-du-Marmandais').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Côtes-de-duras').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Buzet').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Thézac-Perricard').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Côtes-du-brulhois').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Fronton').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Lavilledieu').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Agenais').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Coteaux-et-Terrasses-de-Montauban').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Cahors').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Coteaux-du-Quercy').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Coteaux-de-Glanes').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Entraygues-et-du-Fel').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Estaing').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Gaillac').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Gaillac-Premières-Côtes').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Côtes-du-Tarn').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Côtes-de-Millau').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Marcillac').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Armagnac').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Floc de Gascogne').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Côtes-de-Saint-Mont').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Madiran').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Pacherenc-du-Vic-Bilh').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Côtes-du-Condomois').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Côtes-de-Gascogne').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Côtes-de-Montestruc').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Béarn').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Tursan').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Jurançon').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Bigorre').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Coteaux-de-Chalosse').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Terroirs-landais').save()
		new Wine(region: sudouest, ownerId: ownerId, name: 'Irouléguy').save()
	}
	
	static void initAppellationsLoire(Region loire, String ownerId) {
		new Wine(region: loire, ownerId: ownerId, name: 'Crémant de Loire').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Rosé de Loire').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Val-de-loire	').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Gros-Plant-du-Pays-Nantais').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Muscadet').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Muscadet-Coteaux-de-la-Loire').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Coteaux-d\'Ancenis').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Muscadet-Sèvre-et-Maine').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Muscadet-Côtes-de-Grandlieu').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Fiefs-Vendéens').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Loire-Atlantique').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Vendée').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Anjou').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Cabernet d\'Anjou').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Rosé d\'Anjou').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Anjou-Coteaux-de-la-Loire').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Savennières').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Coteaux-du-layon').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Coteaux-du-layon Chaume').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Quarts-de-Chaume').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Bonnezeaux').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Coteaux-de-l\'Aubance').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Anjou Villages').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Anjou Villages Brissac').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Saumur').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Coteaux-de-Saumur').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Saumur-Champigny').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Cabernet de Saumur').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Maine-et-Loire').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Deux-Sèvres').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Indre-et-Loire').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Vienne').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Saint-Nicolas-de-Bourgueil').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Bourgueil').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Chinon').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Touraine').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Touraine-Azay-le-Rideau').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Touraine-Noble-Joué').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Vouvray').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Montlouis-sur-Loire').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Touraine-Amboise').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Touraine-Mesland').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Cheverny').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Cour-Cheverny').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Coteaux-du-Loir').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Jasnières').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Coteaux-du-Vendômois').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Haut-Poitou').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Loir-et-Cher').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Sarthe').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Coteaux-du-Cher-et-de-l\'Arnon').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Indre').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Orléans').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Orléans-Cléry').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Châteaumeillant').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Coteaux-du-Giennois').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Menetou-Salon').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Pouilly-Fumé').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Pouilly-sur-Loire').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Quincy').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Reuilly').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Sancerre').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Valençay').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Saint-Pourçain').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Côtes-d\'Auvergne').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Côte-Roannaise').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Côtes-du-Forez').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Loiret').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Cher').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Nièvre').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Allier').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Puy-de-Dôme').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Coteaux-Charitois').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Coteaux-de-Tannay').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Bourbonnais').save()
		new Wine(region: loire, ownerId: ownerId, name: 'Urfé').save()
	}

	static void initAppellationsCotesDuRhone(Region cotesdurhone, String ownerId) {
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Côte-Rôtie').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Condrieu').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Château-Grillet').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Saint-Joseph').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Cornas').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Saint-Péray').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Hermitage').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Crozes-Hermitage').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Brézème').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Rasteau').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Gigondas').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Vacqueyras').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Beaumes-de-Venise').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Muscat de Beaumes-de-Venise').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Châteauneuf-du-Pape').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Tavel').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Lirac').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Cairanne').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Chusclan').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Laudun').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Massif-d\'Uchaux').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Plan de Dieu').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Puyméras').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Roaix').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Rochegude').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Rousset-les-Vignes').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Sablet').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Saint-Gervais').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Saint-Maurice-sur-Eygues').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Saint-Pantaléon-les-Vignes').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Séguret').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Signargues').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Valréas').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Visan').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Coteaux-de-Die').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Châtillon-en-Diois').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Clairette de Die').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Crémant de Die').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Côtes-du-Vivarais').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Grignan-les-Adhémar').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Ventoux').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Luberon').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Costières-de-Nîmes').save()
		new Wine(region: cotesdurhone, ownerId: ownerId, name: 'Clairette de Bellegarde').save()
	}
	
	static void initAppellationsCorse(Region corse, String ownerId) {
		new Wine(region: corse, ownerId: ownerId, name: 'Ajaccio').save()
		new Wine(region: corse, ownerId: ownerId, name: 'Figari').save()
		new Wine(region: corse, ownerId: ownerId, name: 'Porto Vecchio').save()
		new Wine(region: corse, ownerId: ownerId, name: 'Sartène').save()
		new Wine(region: corse, ownerId: ownerId, name: 'Calvi').save()
		new Wine(region: corse, ownerId: ownerId, name: 'Patrimonio').save()
		new Wine(region: corse, ownerId: ownerId, name: 'Cap Corse').save()
		new Wine(region: corse, ownerId: ownerId, name: 'Côte Orientale').save()
	}

	static void initAppellationsProvence(Region provence, String ownerId) {
		new Wine(region: provence, ownerId: ownerId, name: 'Côtes de Provence').save()
		new Wine(region: provence, ownerId: ownerId, name: 'Coteaux d\'Aix en Provenc').save()
		new Wine(region: provence, ownerId: ownerId, name: 'Coteaux Varois').save()
		new Wine(region: provence, ownerId: ownerId, name: 'Coteaux de Pierrevert').save()
		new Wine(region: provence, ownerId: ownerId, name: 'Côte du Luberon').save()
		new Wine(region: provence, ownerId: ownerId, name: 'Châteauneuf du Pape').save()
		new Wine(region: provence, ownerId: ownerId, name: 'Bandol').save()
		new Wine(region: provence, ownerId: ownerId, name: 'Bellet').save()
		new Wine(region: provence, ownerId: ownerId, name: 'Cassis').save()
		new Wine(region: provence, ownerId: ownerId, name: 'Palette').save()
	}	
	
	static void deleteForUser(String owner) {
		Bottle.executeUpdate("Delete from Bottle where owner_id = ?", [owner])
		Wine.executeUpdate("Delete from Wine where owner_id = ?", [owner])
		Region.executeUpdate("Delete from Region where owner_id = ?", [owner])
		Dealer.executeUpdate("Delete from Dealer where owner_id = ?", [owner])
		UserAuthority.executeUpdate("Delete from UserAuthority where user_id = ?", [owner])
	}
}

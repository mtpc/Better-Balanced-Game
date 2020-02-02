--==============================================================
--******			C I V I L I Z A T I O N S			  ******
--==============================================================

--==========
-- Macedon
--==========
-- 25% Science from kills
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_TO_WORLDS_END', 'SCIENCE_ON_KILLS_BBG');
INSERT INTO Modifiers (ModifierId, ModifierType)
	VALUES ('SCIENCE_ON_KILLS_BBG', 'MODIFIER_PLAYER_UNITS_ADJUST_POST_COMBAT_YIELD');
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES
		('SCIENCE_ON_KILLS_BBG', 'PercentDefeatedStrength', '25'),
		('SCIENCE_ON_KILLS_BBG', 'YieldType', 'YIELD_SCIENCE');
-- +20% Production for 10 turns after conquering a city
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES
	('TRAIT_CIVILIZATION_HELLENISTIC_FUSION' , 'TRAIT_CIVILIZATION_HELLENISTIC_FUSION_PRODUCTION_MODIFIER');
INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES
	('TRAIT_CIVILIZATION_HELLENISTIC_FUSION_PRODUCTION_MODIFIER' , 'MODIFIER_PLAYER_ADD_DIPLOMATIC_YIELD_MODIFIER');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES 
	('TRAIT_CIVILIZATION_HELLENISTIC_FUSION_PRODUCTION_MODIFIER' , 'DiplomaticYieldSource' , 'CITY_CAPTURED'   ),
	('TRAIT_CIVILIZATION_HELLENISTIC_FUSION_PRODUCTION_MODIFIER' , 'TurnsActive'           , '10'              ),
	('TRAIT_CIVILIZATION_HELLENISTIC_FUSION_PRODUCTION_MODIFIER' , 'YieldType'             , 'YIELD_PRODUCTION'),
	('TRAIT_CIVILIZATION_HELLENISTIC_FUSION_PRODUCTION_MODIFIER' , 'Amount'                , '20'              );
-- Hetairoi no longer a Horseman replacement
DELETE FROM UnitReplaces WHERE CivUniqueUnitType='UNIT_MACEDONIAN_HETAIROI';


--==================
-- Persia
--==================
-- Pairidaeza gets yields for other district types as well
INSERT INTO Adjacency_YieldChanges
	(ID, Description, YieldType, YieldChange, TilesRequired, AdjacentDistrict)
	VALUES
	('PAIRIDAEZA_CAMPUSADJACENCY', 'Placeholder', 'YIELD_CULTURE', 1, 1, 'DISTRICT_CAMPUS'),
	('PAIRIDAEZA_INDUSTRIALADJACENCY', 'Placeholder', 'YIELD_GOLD', 1, 1, 'DISTRICT_INDUSTRIAL_ZONE'),
	('PAIRIDAEZA_HARBORADJACENCY', 'Placeholder', 'YIELD_GOLD', 1, 1, 'DISTRICT_HARBOR');
INSERT INTO Improvement_Adjacencies
	(ImprovementType, YieldChangeId)
	VALUES
	('IMPROVEMENT_PAIRIDAEZA', 'PAIRIDAEZA_CAMPUSADJACENCY'),
	('IMPROVEMENT_PAIRIDAEZA', 'PAIRIDAEZA_INDUSTRIALADJACENCY'),
	('IMPROVEMENT_PAIRIDAEZA', 'PAIRIDAEZA_HARBORADJACENCY');
-- internal trades routes scaling
INSERT INTO RequirementSets
	(RequirementSetId , RequirementSetType)
	VALUES
	('PERSIA_MEDIEVAL_FAIRES_REQUIREMENTS_CPLMOD', 	'REQUIREMENTSET_TEST_ALL'),
	('PERSIA_URBANIZATION_REQUIREMENTS_CPLMOD', 	'REQUIREMENTSET_TEST_ALL'),
	('PERSIA_BANKING_REQUIREMENTS_CPLMOD'   , 		'REQUIREMENTSET_TEST_ALL'),
	('PERSIA_ECONOMICS_REQUIREMENTS_CPLMOD' , 		'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements
	(RequirementSetId , RequirementId)
	VALUES
	('PERSIA_MEDIEVAL_FAIRES_REQUIREMENTS_CPLMOD', 	'PLAYER_HAS_MEDIEVAL_FAIRES_CPLMOD'),
	('PERSIA_URBANIZATION_REQUIREMENTS_CPLMOD', 	'PLAYER_HAS_URBANIZATION_CPLMOD'),
	('PERSIA_BANKING_REQUIREMENTS_CPLMOD'   , 		'PLAYER_HAS_BANKING_CPLMOD'  ),
	('PERSIA_ECONOMICS_REQUIREMENTS_CPLMOD' , 		'PLAYER_HAS_ECONOMICS_CPLMOD');
INSERT INTO Modifiers
	(ModifierId, ModifierType, SubjectRequirementSetId)
	VALUES
	('TRAIT_SATRAPIES_INTERNAL_TRADE_CULTURE_AT_MEDIEVAL_FAIRES',	'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC', 'PERSIA_MEDIEVAL_FAIRES_REQUIREMENTS_CPLMOD'),
	('TRAIT_SATRAPIES_INTERNAL_TRADE_CULTURE_AT_URBANIZATION',		'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC', 'PERSIA_URBANIZATION_REQUIREMENTS_CPLMOD'),
	('TRAIT_SATRAPIES_INTERNAL_TRADE_GOLD_AT_BANKING',				'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC', 'PERSIA_BANKING_REQUIREMENTS_CPLMOD'),
	('TRAIT_SATRAPIES_INTERNAL_TRADE_GOLD_AT_ECONOMICS',			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC', 'PERSIA_ECONOMICS_REQUIREMENTS_CPLMOD');
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
	VALUES
	('TRAIT_SATRAPIES_INTERNAL_TRADE_CULTURE_AT_MEDIEVAL_FAIRES', 	'YieldType', 	'YIELD_CULTURE'),
	('TRAIT_SATRAPIES_INTERNAL_TRADE_CULTURE_AT_MEDIEVAL_FAIRES', 	'Amount', 		'2'),
	('TRAIT_SATRAPIES_INTERNAL_TRADE_CULTURE_AT_URBANIZATION', 		'YieldType', 	'YIELD_CULTURE'),
	('TRAIT_SATRAPIES_INTERNAL_TRADE_CULTURE_AT_URBANIZATION', 		'Amount', 		'4'),
	('TRAIT_SATRAPIES_INTERNAL_TRADE_GOLD_AT_BANKING', 				'YieldType', 	'YIELD_GOLD'),
	('TRAIT_SATRAPIES_INTERNAL_TRADE_GOLD_AT_BANKING', 				'Amount', 		'2'),
	('TRAIT_SATRAPIES_INTERNAL_TRADE_GOLD_AT_ECONOMICS', 			'YieldType', 	'YIELD_GOLD'),
	('TRAIT_SATRAPIES_INTERNAL_TRADE_GOLD_AT_ECONOMICS', 			'Amount', 		'4');
INSERT INTO TraitModifiers
	(TraitType, ModifierId)
	VALUES
	('TRAIT_CIVILIZATION_SATRAPIES', 'TRAIT_SATRAPIES_INTERNAL_TRADE_CULTURE_AT_MEDIEVAL_FAIRES'),
	('TRAIT_CIVILIZATION_SATRAPIES', 'TRAIT_SATRAPIES_INTERNAL_TRADE_CULTURE_AT_URBANIZATION'),
	('TRAIT_CIVILIZATION_SATRAPIES', 'TRAIT_SATRAPIES_INTERNAL_TRADE_GOLD_AT_BANKING'),
	('TRAIT_CIVILIZATION_SATRAPIES', 'TRAIT_SATRAPIES_INTERNAL_TRADE_GOLD_AT_ECONOMICS');
-- +3 combat when attacking
INSERT INTO Modifiers
	(ModifierId, ModifierType, SubjectRequirementSetId)
	VALUES
	('TRAIT_FALLBABYLON_COMBAT_BONUS', 'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH', 'ATTACKING_REQUIREMENT_SET');
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
	VALUES
	('TRAIT_FALLBABYLON_COMBAT_BONUS', 'Amount', '3');
INSERT INTO ModifierStrings
	(ModifierId, Context, Text)
	VALUES
	('TRAIT_FALLBABYLON_COMBAT_BONUS', 'Preview', 'LOC_TRAIT_FALLBABYLON_COMBAT_BONUS_DESCRIPTION');
INSERT INTO RequirementSets
	(RequirementSetId , RequirementSetType)
	VALUES
	('ATTACKING_REQUIREMENT_SET', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements
	(RequirementSetId , RequirementId)
	VALUES
	('ATTACKING_REQUIREMENT_SET', 'PLAYER_IS_ATTACKER_REQUIREMENTS');
INSERT INTO TraitModifiers
	(TraitType, ModifierId)
	VALUES
	('TRAIT_LEADER_FALL_BABYLON', 'TRAIT_FALLBABYLON_COMBAT_BONUS');
-- Persia surprise war movement bonus nullified
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRAIT_FALLBABYLON_SURPRISE_MOVEMENT' and Name='Amount';
-- Immortals defense buffed and ranged nerfed (since it is affected by oligarchy)
UPDATE Units SET Combat=35, RangedCombat=20 WHERE UnitType='UNIT_PERSIAN_IMMORTAL';



--==============================================================
--******			W O N D E R S  (MAN-MADE)			  ******
--==============================================================
-- Apadana +1 envoy instead of 2
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='APADANA_AWARD_TWO_INFLUENCE_TOKEN_MODIFIER';





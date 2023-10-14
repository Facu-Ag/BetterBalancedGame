--==============================================================
--******			  D E D I C A T I O N S				  ******
--==============================================================
-- To Arms +10 vs cities
INSERT OR IGNORE INTO CommemorationModifiers (CommemorationType, ModifierId)
    VALUES ('COMMEMORATION_MILITARY', 'COMMEMORATION_MILITARY_GA_ATTACK_CITIES');
INSERT OR IGNORE INTO Modifiers (ModifierId , ModifierType , OwnerRequirementSetId)
    VALUES ('COMMEMORATION_MILITARY_GA_ATTACK_CITIES' , 'MODIFIER_PLAYER_UNITS_GRANT_ABILITY' , 'PLAYER_HAS_GOLDEN_AGE');
INSERT OR IGNORE INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('COMMEMORATION_MILITARY_GA_ATTACK_CITIES' , 'AbilityType' , 'ABILITY_MILITARY_GA_BUFF');
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('ABILITY_MILITARY_GA_BUFF', 'KIND_ABILITY');
INSERT OR IGNORE INTO TypeTags (Type, Tag) VALUES
	('ABILITY_MILITARY_GA_BUFF', 'CLASS_NAVAL_MELEE'),
	('ABILITY_MILITARY_GA_BUFF', 'CLASS_NAVAL_RANGED'),
	('ABILITY_MILITARY_GA_BUFF', 'CLASS_NAVAL_RAIDER'),
	('ABILITY_MILITARY_GA_BUFF', 'CLASS_NAVAL_CARRIER'),
	('ABILITY_MILITARY_GA_BUFF', 'CLASS_RECON'),
	('ABILITY_MILITARY_GA_BUFF', 'CLASS_MELEE'),
	('ABILITY_MILITARY_GA_BUFF', 'CLASS_RANGED'),
	('ABILITY_MILITARY_GA_BUFF', 'CLASS_SIEGE'),
	('ABILITY_MILITARY_GA_BUFF', 'CLASS_HEAVY_CAVALRY'),
	('ABILITY_MILITARY_GA_BUFF', 'CLASS_LIGHT_CAVALRY'),
	('ABILITY_MILITARY_GA_BUFF', 'CLASS_RANGED_CAVALRY'),
	('ABILITY_MILITARY_GA_BUFF', 'CLASS_ANTI_CAVALRY'),
	('ABILITY_MILITARY_GA_BUFF', 'CLASS_HEAVY_CHARIOT'),
	('ABILITY_MILITARY_GA_BUFF', 'CLASS_LIGHT_CHARIOT'),
	('ABILITY_MILITARY_GA_BUFF', 'CLASS_WARRIOR_MONK'),
	('ABILITY_MILITARY_GA_BUFF', 'CLASS_WAR_CART'),
	('ABILITY_MILITARY_GA_BUFF', 'CLASS_AIRCRAFT'),
	('ABILITY_MILITARY_GA_BUFF', 'CLASS_AIR_BOMBER'),
	('ABILITY_MILITARY_GA_BUFF', 'CLASS_AIR_FIGHTER');
INSERT OR IGNORE INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive) VALUES
	('ABILITY_MILITARY_GA_BUFF', 'LOC_ABILITY_MILITARY_GA_BUFF_NAME', 'LOC_ABILITY_MILITARY_GA_BUFF_DESCRIPTION', 1);
INSERT OR IGNORE INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES
	('ABILITY_MILITARY_GA_BUFF', 'MOD_MILITARY_GA_BUFF');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
	('MOD_MILITARY_GA_BUFF', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH', 'UNIT_ATTACKING_DISTRICT_REQUIREMENTS');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('MOD_MILITARY_GA_BUFF', 'Amount', '10');
INSERT OR IGNORE INTO ModifierStrings (ModifierId, Context, Text) VALUES
('MOD_MILITARY_GA_BUFF', 'Preview', 'LOC_MILITARY_GA_BUFF_DESCRIPTION');
-- Sic Hunt Dracones works on all new cities, not just diff continent
UPDATE Modifiers SET ModifierType='MODIFIER_PLAYER_CITIES_ADD_POPULATION', NewOnly=1, Permanent=1 WHERE ModifierId='COMMEMORATION_EXPLORATION_GA_NEW_CITY_POPULATION';
-- Monumentality discount reduced from 30% to 10%
UPDATE ModifierArguments SET Value='10' WHERE ModifierId='COMMEMORATION_INFRASTRUCTURE_BUILDER_DISCOUNT_MODIFIER' AND Name='Amount';
UPDATE ModifierArguments SET Value='10' WHERE ModifierId='COMMEMORATION_INFRASTRUCTURE_SETTLER_DISCOUNT_MODIFIER' AND Name='Amount';
-- Pen and Brush gives +2 Culture and +1 Gold per District
INSERT OR IGNORE INTO Modifiers (ModifierId , ModifierType , OwnerRequirementSetId)
    VALUES ('COMMEMORATION_CULTURAL_DISTRICTGOLD' , 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_DISTRICT' , 'PLAYER_HAS_GOLDEN_AGE');
INSERT OR IGNORE INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('COMMEMORATION_CULTURAL_DISTRICTGOLD' , 'YieldType' , 'YIELD_GOLD');
INSERT OR IGNORE INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('COMMEMORATION_CULTURAL_DISTRICTGOLD' , 'Amount' , '1');
INSERT OR IGNORE INTO CommemorationModifiers (CommemorationType, ModifierId)
	VALUES ('COMMEMORATION_CULTURAL', 'COMMEMORATION_CULTURAL_DISTRICTGOLD');
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='COMMEMORATION_CULTURAL_DISTRICTCULTURE' and Name='Amount';

--21/06/23 Exodus gives +2 gold +1 science +1 culture per foreign city following your religion
-- Stay even after golden
-- INSERT INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId) VALUES
-- 	('BBG_EXODUS_GOLD_PER_FOREIGN_CITY_FOLLOWING_RELIGION', 'MODIFIER_PLAYER_RELIGION_ADD_PLAYER_BELIEF_YIELD', 'PLAYER_HAS_GOLDEN_AGE'),
-- 	('BBG_EXODUS_CULTURE_PER_FOREIGN_CITY_FOLLOWING_RELIGION', 'MODIFIER_PLAYER_RELIGION_ADD_PLAYER_BELIEF_YIELD', 'PLAYER_HAS_GOLDEN_AGE'),
-- 	('BBG_EXODUS_SCIENCE_PER_FOREIGN_CITY_FOLLOWING_RELIGION', 'MODIFIER_PLAYER_RELIGION_ADD_PLAYER_BELIEF_YIELD', 'PLAYER_HAS_GOLDEN_AGE');
-- INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
-- 	('BBG_EXODUS_GOLD_PER_FOREIGN_CITY_FOLLOWING_RELIGION', 'BeliefYieldType', 'BELIEF_YIELD_PER_FOREIGN_CITY'),
-- 	('BBG_EXODUS_GOLD_PER_FOREIGN_CITY_FOLLOWING_RELIGION', 'YieldType', 'YIELD_GOLD'),
-- 	('BBG_EXODUS_GOLD_PER_FOREIGN_CITY_FOLLOWING_RELIGION', 'Amount', '2'),
-- 	('BBG_EXODUS_GOLD_PER_FOREIGN_CITY_FOLLOWING_RELIGION', 'PerXItems', '1'),
-- 	('BBG_EXODUS_CULTURE_PER_FOREIGN_CITY_FOLLOWING_RELIGION', 'BeliefYieldType', 'BELIEF_YIELD_PER_FOREIGN_CITY'),
-- 	('BBG_EXODUS_CULTURE_PER_FOREIGN_CITY_FOLLOWING_RELIGION', 'YieldType', 'YIELD_CULTURE'),
-- 	('BBG_EXODUS_CULTURE_PER_FOREIGN_CITY_FOLLOWING_RELIGION', 'Amount', '1'),
-- 	('BBG_EXODUS_CULTURE_PER_FOREIGN_CITY_FOLLOWING_RELIGION', 'PerXItems', '1'),
-- 	('BBG_EXODUS_SCIENCE_PER_FOREIGN_CITY_FOLLOWING_RELIGION', 'BeliefYieldType', 'BELIEF_YIELD_PER_FOREIGN_CITY'),
-- 	('BBG_EXODUS_SCIENCE_PER_FOREIGN_CITY_FOLLOWING_RELIGION', 'YieldType', 'YIELD_SCIENCE'),
-- 	('BBG_EXODUS_SCIENCE_PER_FOREIGN_CITY_FOLLOWING_RELIGION', 'Amount', '1'),
-- 	('BBG_EXODUS_SCIENCE_PER_FOREIGN_CITY_FOLLOWING_RELIGION', 'PerXItems', '1');
-- INSERT INTO CommemorationModifiers (CommemorationType, ModifierId) VALUES
-- 	('COMMEMORATION_RELIGIOUS', 'BBG_EXODUS_GOLD_PER_FOREIGN_CITY_FOLLOWING_RELIGION'),
-- 	('COMMEMORATION_RELIGIOUS', 'BBG_EXODUS_CULTURE_PER_FOREIGN_CITY_FOLLOWING_RELIGION'),
-- 	('COMMEMORATION_RELIGIOUS', 'BBG_EXODUS_SCIENCE_PER_FOREIGN_CITY_FOLLOWING_RELIGION');

-- 21/06/23 Exodus gives 25% discount for religious unit
INSERT INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId) VALUES
	('BBG_EXODUS_MISSIONARY_REDUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST', 'PLAYER_HAS_GOLDEN_AGE'),
	('BBG_EXODUS_APOSTLE_REDUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST', 'PLAYER_HAS_GOLDEN_AGE'),
	('BBG_EXODUS_GURU_REDUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST', 'PLAYER_HAS_GOLDEN_AGE'),
	('BBG_EXODUS_INQUISITOR_REDUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST', 'PLAYER_HAS_GOLDEN_AGE');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('BBG_EXODUS_MISSIONARY_REDUCTION', 'UnitType', 'UNIT_MISSIONARY'),
	('BBG_EXODUS_MISSIONARY_REDUCTION', 'Amount', 20),
	('BBG_EXODUS_APOSTLE_REDUCTION', 'UnitType', 'UNIT_APOSTLE'),
	('BBG_EXODUS_APOSTLE_REDUCTION', 'Amount', 20),
	('BBG_EXODUS_GURU_REDUCTION', 'UnitType', 'UNIT_GURU'),
	('BBG_EXODUS_GURU_REDUCTION', 'Amount', 20),
	('BBG_EXODUS_INQUISITOR_REDUCTION', 'UnitType', 'UNIT_INQUISITOR'),
	('BBG_EXODUS_INQUISITOR_REDUCTION', 'Amount', 20);
INSERT INTO CommemorationModifiers (CommemorationType, ModifierId) VALUES
    ('COMMEMORATION_RELIGIOUS', 'BBG_EXODUS_MISSIONARY_REDUCTION'),
    ('COMMEMORATION_RELIGIOUS', 'BBG_EXODUS_APOSTLE_REDUCTION'),
    ('COMMEMORATION_RELIGIOUS', 'BBG_EXODUS_GURU_REDUCTION'),
    ('COMMEMORATION_RELIGIOUS', 'BBG_EXODUS_INQUISITOR_REDUCTION');


--==============================================================
--******				S  C  O  R  E				  	  ******
--==============================================================
-- no double counting for era points
UPDATE ScoringLineItems SET Multiplier=0 WHERE LineItemType='LINE_ITEM_ERA_SCORE';

--==============================================================
--******				    O T H E R					  ******
--==============================================================
-- Offshore Oil can be improved at Plastics
UPDATE Improvements SET PrereqTech='TECH_PLASTICS' WHERE ImprovementType='IMPROVEMENT_OFFSHORE_OIL_RIG';

--==============================================================
--******				    ALLIANCES					  ******
--==============================================================
--14/04/23 economic alliance from 4g to 6g/1p
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
	('ALLIANCE_ADD_PROD_TO_ORIGIN_TRADE_ROUTE', 'MODIFIER_ALLIANCE_TRADE_ROUTE_ADJUST_YIELD', 'ROUTE_BETWEEN_ALLIES_REQUIREMENTS'),
	('ALLIANCE_ADD_PROD_TO_DESTINATION_TRADE_ROUTE', 'MODIFIER_ALLIANCE_TRADE_ROUTE_ADJUST_YIELD', 'ROUTE_BETWEEN_ALLIES_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('ALLIANCE_ADD_PROD_TO_ORIGIN_TRADE_ROUTE', 'AffectDestination', 1),
	('ALLIANCE_ADD_PROD_TO_DESTINATION_TRADE_ROUTE', 'AffectOrigin', 1),
	('ALLIANCE_ADD_PROD_TO_ORIGIN_TRADE_ROUTE', 'Amount', 1),
	('ALLIANCE_ADD_PROD_TO_DESTINATION_TRADE_ROUTE', 'Amount', 1),
	('ALLIANCE_ADD_PROD_TO_ORIGIN_TRADE_ROUTE', 'YieldType', 'YIELD_PRODUCTION'),
	('ALLIANCE_ADD_PROD_TO_DESTINATION_TRADE_ROUTE', 'YieldType', 'YIELD_PRODUCTION');
INSERT INTO AllianceEffects (LevelRequirement, AllianceType, ModifierID) VALUES
	('1', 'ALLIANCE_ECONOMIC', 'ALLIANCE_ADD_PROD_TO_ORIGIN_TRADE_ROUTE'),
	('1', 'ALLIANCE_ECONOMIC', 'ALLIANCE_ADD_PROD_TO_DESTINATION_TRADE_ROUTE');

UPDATE ModifierArguments SET Value=6 WHERE ModifierId='ALLIANCE_ADD_GOLD_TO_ORIGIN_TRADE_ROUTE' AND Name='Amount';
UPDATE ModifierArguments SET Value=6 WHERE ModifierId='ALLIANCE_ADD_GOLD_TO_DESTINATION_TRADE_ROUTE' AND Name='Amount';

--14/04/23 religious alliance from 2faith to 4faith
UPDATE ModifierArguments SET Value=4 WHERE ModifierId='ALLIANCE_ADD_FAITH_TO_ORIGIN_TRADE_ROUTE' AND Name='Amount';
UPDATE ModifierArguments SET Value=4 WHERE ModifierId='ALLIANCE_ADD_FAITH_TO_DESTINATION_TRADE_ROUTE' AND Name='Amount';
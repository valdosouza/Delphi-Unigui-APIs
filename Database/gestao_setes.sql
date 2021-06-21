-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 12-Out-2020 às 00:46
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `gestao_setes`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_address`
--

CREATE TABLE `tb_address` (
  `id` int(11) NOT NULL,
  `street` varchar(100) NOT NULL DEFAULT 'não informado',
  `nmbr` varchar(10) DEFAULT 'sn',
  `complement` varchar(100) DEFAULT NULL,
  `neighborhood` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `kind` varchar(100) NOT NULL DEFAULT '',
  `zip_code` varchar(15) DEFAULT NULL,
  `tb_country_id` int(11) NOT NULL,
  `tb_state_id` int(11) NOT NULL,
  `tb_city_id` int(11) NOT NULL,
  `main` char(1) NOT NULL DEFAULT 'Y',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_advertiser`
--

CREATE TABLE `tb_advertiser` (
  `id` int(11) NOT NULL DEFAULT 0,
  `tb_institution_id` int(11) NOT NULL DEFAULT 0,
  `dt_record` date DEFAULT NULL,
  `active` char(1) NOT NULL DEFAULT 'S',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_agency`
--

CREATE TABLE `tb_agency` (
  `id` int(11) NOT NULL DEFAULT 0,
  `tb_institution_id` int(11) NOT NULL DEFAULT 0,
  `dt_record` date DEFAULT NULL,
  `active` char(1) NOT NULL DEFAULT 'S',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `aliq_com` decimal(10,2) DEFAULT 20.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_bank`
--

CREATE TABLE `tb_bank` (
  `id` int(11) NOT NULL,
  `number` varchar(3) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_bank_account`
--

CREATE TABLE `tb_bank_account` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_bank_id` int(11) NOT NULL,
  `dt_opening` date DEFAULT NULL,
  `agency` varchar(8) DEFAULT NULL,
  `agency_dv` varchar(2) DEFAULT NULL,
  `number` varchar(10) DEFAULT NULL,
  `number_dv` varchar(2) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `manager` varchar(25) DEFAULT NULL,
  `limit_value` decimal(10,2) DEFAULT NULL,
  `dt_contract` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_bank_charge_kind`
--

CREATE TABLE `tb_bank_charge_kind` (
  `id` int(11) NOT NULL,
  `tb_bank_id` int(11) NOT NULL,
  `abbreviation` varchar(10) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_bank_charge_slip`
--

CREATE TABLE `tb_bank_charge_slip` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_bank_account_id` int(11) NOT NULL,
  `tb_bank_charge_ticket_id` int(11) NOT NULL,
  `tb_bank_charge_kind_id` int(11) NOT NULL,
  `agreement` varchar(30) DEFAULT NULL,
  `variacao` int(11) DEFAULT NULL,
  `accept` char(1) DEFAULT NULL,
  `layout` int(11) DEFAULT NULL,
  `layout_shipping` varchar(10) DEFAULT NULL,
  `instruction_1` varchar(60) DEFAULT NULL,
  `instruction_2` varchar(60) DEFAULT NULL,
  `instruction` blob DEFAULT NULL,
  `aliq_discount` decimal(10,2) DEFAULT NULL,
  `aliq_interest` decimal(10,2) DEFAULT NULL,
  `aliq_late` decimal(10,2) DEFAULT NULL,
  `value_late_min` decimal(10,2) DEFAULT NULL,
  `value_fine` decimal(10,2) DEFAULT NULL,
  `aliq_fine` decimal(10,2) DEFAULT NULL,
  `value_rate` decimal(10,2) DEFAULT NULL,
  `path_files` varchar(100) DEFAULT NULL,
  `name_files` varchar(100) DEFAULT NULL,
  `protest` char(1) DEFAULT NULL,
  `day_protest` int(11) DEFAULT NULL,
  `payment_local` varchar(60) DEFAULT NULL,
  `transmission_code` varchar(30) DEFAULT NULL,
  `benefic_post` varchar(5) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_bank_charge_ticket`
--

CREATE TABLE `tb_bank_charge_ticket` (
  `id` int(11) NOT NULL,
  `tb_bank_id` int(11) NOT NULL,
  `number` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `emission_by` char(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_bank_historic`
--

CREATE TABLE `tb_bank_historic` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_bank_id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_brand`
--

CREATE TABLE `tb_brand` (
  `id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `tb_provider_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_broadcaster`
--

CREATE TABLE `tb_broadcaster` (
  `id` int(11) NOT NULL DEFAULT 0,
  `tb_institution_id` int(11) NOT NULL DEFAULT 0,
  `dt_record` date DEFAULT NULL,
  `active` char(1) NOT NULL DEFAULT 'S',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `kind_media` int(11) DEFAULT NULL,
  `aliq_com` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_broadcaster_has_circulation`
--

CREATE TABLE `tb_broadcaster_has_circulation` (
  `tb_broadcaster_id` int(11) NOT NULL,
  `tb_city_id` int(11) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_budg_advertise`
--

CREATE TABLE `tb_budg_advertise` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_budg_advertise_imp`
--

CREATE TABLE `tb_budg_advertise_imp` (
  `id` int(11) NOT NULL DEFAULT 0,
  `tb_institution_id` int(11) NOT NULL,
  `tb_budg_advertise_id` int(11) NOT NULL,
  `tb_city_id` int(11) NOT NULL,
  `tb_broadcaster_id` int(11) NOT NULL,
  `tb_med_price_list_jr_id` int(11) DEFAULT 0,
  `formats` varchar(100) DEFAULT NULL,
  `insertion` int(11) DEFAULT NULL,
  `unit_value` decimal(10,2) DEFAULT 0.00,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_budg_advertise_web`
--

CREATE TABLE `tb_budg_advertise_web` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_budg_advertise_id` int(11) NOT NULL,
  `tb_city_id` int(11) NOT NULL,
  `tb_broadcaster_id` int(11) NOT NULL,
  `formats` varchar(100) DEFAULT NULL,
  `tb_med_price_list_ol_id` int(11) DEFAULT 0,
  `days` int(11) DEFAULT NULL,
  `page_views` int(11) DEFAULT NULL,
  `unit_value` decimal(10,2) DEFAULT 0.00,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_button`
--

CREATE TABLE `tb_button` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_carrier`
--

CREATE TABLE `tb_carrier` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `active` char(1) NOT NULL DEFAULT 'S',
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cashier`
--

CREATE TABLE `tb_cashier` (
  `id` int(11) NOT NULL DEFAULT 0,
  `tb_institution_id` int(11) NOT NULL DEFAULT 0,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `dt_record` datetime DEFAULT NULL,
  `tb_userid` int(11) DEFAULT NULL,
  `hr_begin` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `hr_end` timestamp NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cashier_items`
--

CREATE TABLE `tb_cashier_items` (
  `id` int(11) NOT NULL DEFAULT 0,
  `tb_institution_id` int(11) NOT NULL DEFAULT 0,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `tb_cashier_id` int(11) NOT NULL DEFAULT 0,
  `kind` char(1) DEFAULT NULL,
  `tb_payment_types_id` int(11) DEFAULT NULL,
  `SET_VALUE` decimal(10,2) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_category`
--

CREATE TABLE `tb_category` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `posit_level` varchar(40) DEFAULT NULL,
  `kind` char(1) DEFAULT NULL,
  `active` varchar(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cest`
--

CREATE TABLE `tb_cest` (
  `cest` varchar(7) NOT NULL,
  `ncm` varchar(8) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cfop`
--

CREATE TABLE `tb_cfop` (
  `id` varchar(10) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `concise` varchar(60) DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `register` int(11) DEFAULT NULL,
  `way` varchar(1) DEFAULT NULL,
  `jurisdiction` varchar(1) DEFAULT NULL,
  `note` blob DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cfop_to_cfop`
--

CREATE TABLE `tb_cfop_to_cfop` (
  `tb_cfop_id_ori` varchar(10) NOT NULL,
  `tb_cfop_id_des` varchar(10) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_city`
--

CREATE TABLE `tb_city` (
  `id` int(11) NOT NULL,
  `tb_state_id` int(11) NOT NULL,
  `ibge` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `aliq_iss` decimal(10,2) NOT NULL DEFAULT 0.00,
  `population` int(11) DEFAULT 0,
  `density` decimal(10,2) DEFAULT 0.00,
  `area` decimal(10,2) DEFAULT 0.00,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_clin_answer`
--

CREATE TABLE `tb_clin_answer` (
  `tb_institution_id` int(11) NOT NULL DEFAULT 0,
  `tb_clin_quiz_id` int(11) NOT NULL,
  `tb_clin_questionnaire_id` int(11) NOT NULL DEFAULT 0,
  `tb_clin_question_id` int(11) NOT NULL DEFAULT 0,
  `reached` char(1) DEFAULT NULL,
  `note` blob DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_clin_module`
--

CREATE TABLE `tb_clin_module` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `sequence_id` int(11) DEFAULT 0,
  `description` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_clin_patient`
--

CREATE TABLE `tb_clin_patient` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_clin_module_id` int(11) NOT NULL DEFAULT 0,
  `active` char(1) NOT NULL DEFAULT 'N',
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_clin_professional`
--

CREATE TABLE `tb_clin_professional` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `active` char(1) NOT NULL DEFAULT 'N',
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_clin_professional_has_patient`
--

CREATE TABLE `tb_clin_professional_has_patient` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_clin_professional_id` int(11) NOT NULL,
  `tb_clin_patient_id` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_clin_question`
--

CREATE TABLE `tb_clin_question` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL DEFAULT 0,
  `tb_clin_questionnaire_id` int(11) NOT NULL DEFAULT 0,
  `description` varchar(255) DEFAULT NULL,
  `kind` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_clin_questionnaire`
--

CREATE TABLE `tb_clin_questionnaire` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL DEFAULT 0,
  `description` varchar(100) DEFAULT NULL,
  `dt_record` date DEFAULT NULL,
  `tb_clin_module_id` int(11) NOT NULL DEFAULT 0,
  `tb_linebusiness_id` int(11) NOT NULL DEFAULT 0,
  `tb_clin_professional_id` int(11) NOT NULL DEFAULT 0,
  `active` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_clin_quiz`
--

CREATE TABLE `tb_clin_quiz` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL DEFAULT 0,
  `tb_clin_questionnaire_id` int(11) NOT NULL DEFAULT 0,
  `dt_record` date DEFAULT NULL,
  `tb_clin_module_id` int(11) NOT NULL DEFAULT 0,
  `tb_linebusiness_id` int(11) NOT NULL,
  `tb_clin_professional_id` int(11) NOT NULL,
  `tb_clin_patient_id` int(11) NOT NULL,
  `reached_tx` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_collaborator`
--

CREATE TABLE `tb_collaborator` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `dt_admission` date DEFAULT NULL,
  `dt_resignation` date DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `pis` varchar(11) DEFAULT NULL,
  `fahters_name` varchar(100) DEFAULT NULL,
  `mothers_name` varchar(100) DEFAULT NULL,
  `vote_number` varchar(20) DEFAULT NULL,
  `vote_zone` varchar(3) DEFAULT NULL,
  `vote_section` varchar(3) DEFAULT NULL,
  `military_certificate` varchar(15) DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_color`
--

CREATE TABLE `tb_color` (
  `id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_company`
--

CREATE TABLE `tb_company` (
  `id` int(11) NOT NULL,
  `cnpj` char(14) NOT NULL DEFAULT '0',
  `ie` varchar(45) DEFAULT NULL,
  `im` varchar(45) DEFAULT NULL,
  `iest` varchar(45) DEFAULT NULL,
  `dt_foundation` date DEFAULT NULL,
  `crt` char(1) DEFAULT NULL,
  `crt_modal` char(1) DEFAULT NULL,
  `ind_ie_destinatario` varchar(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `iss_ind_exig` char(2) DEFAULT NULL,
  `iss_retencao` char(1) DEFAULT NULL,
  `iss_inc_fiscal` char(1) DEFAULT NULL,
  `iss_process_number` varchar(50) DEFAULT NULL,
  `send_xml_nfe_only` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_config`
--

CREATE TABLE `tb_config` (
  `tb_institution_id` int(11) NOT NULL,
  `field` varchar(50) NOT NULL,
  `tb_user_id` int(11) DEFAULT NULL,
  `kind` char(1) DEFAULT NULL,
  `content` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_config_nfe`
--

CREATE TABLE `tb_config_nfe` (
  `tb_institution_id` int(11) NOT NULL,
  `layer` char(1) DEFAULT NULL,
  `version` varchar(10) NOT NULL,
  `type_emission` char(1) DEFAULT NULL,
  `certificate` varchar(100) DEFAULT NULL,
  `certificate_serie` varchar(50) NOT NULL,
  `certificate_pass` varchar(50) NOT NULL,
  `certificate_path` varchar(255) NOT NULL,
  `set_view_msg` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_config_nfe_55`
--

CREATE TABLE `tb_config_nfe_55` (
  `tb_institution_id` int(11) NOT NULL,
  `orientation` char(1) DEFAULT NULL,
  `receipt_posit` char(1) DEFAULT NULL,
  `set_invoice` char(1) DEFAULT NULL,
  `set_duplicate` char(1) DEFAULT NULL,
  `sendNfeToaccounting` char(1) DEFAULT NULL,
  `sendNfeToyourSelf` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_config_nfe_65`
--

CREATE TABLE `tb_config_nfe_65` (
  `tb_institution_id` int(11) NOT NULL,
  `id_token_nfce` varchar(10) DEFAULT NULL,
  `token_nfce` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_contact`
--

CREATE TABLE `tb_contact` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_entity_owner_id` int(11) NOT NULL,
  `active` char(1) NOT NULL DEFAULT 'N',
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_country`
--

CREATE TABLE `tb_country` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_crashlytics`
--

CREATE TABLE `tb_crashlytics` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_user_id` int(11) NOT NULL,
  `origen` varchar(100) NOT NULL,
  `message` blob DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_customer`
--

CREATE TABLE `tb_customer` (
  `id` int(11) NOT NULL DEFAULT 0,
  `tb_institution_id` int(11) NOT NULL DEFAULT 0,
  `tb_salesman_id` int(11) DEFAULT NULL,
  `tb_vendor_id` int(11) DEFAULT NULL,
  `tb_carrier_id` int(11) DEFAULT NULL,
  `credit_status` char(1) DEFAULT NULL,
  `credit_value` decimal(10,2) DEFAULT NULL,
  `wallet` char(1) DEFAULT NULL,
  `consumer` char(1) DEFAULT NULL,
  `multiplier` decimal(10,2) DEFAULT NULL,
  `by_pass_st` char(1) DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_deter_base_tax_icms`
--

CREATE TABLE `tb_deter_base_tax_icms` (
  `id` char(2) NOT NULL DEFAULT '',
  `description` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_deter_base_tax_icms_st`
--

CREATE TABLE `tb_deter_base_tax_icms_st` (
  `id` char(2) NOT NULL DEFAULT '',
  `description` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_devices`
--

CREATE TABLE `tb_devices` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `tb_user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `identification` varchar(255) DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `shelf_life` date DEFAULT NULL,
  `app_name` varchar(255) DEFAULT NULL,
  `download` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_discharge_icms`
--

CREATE TABLE `tb_discharge_icms` (
  `id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_entity`
--

CREATE TABLE `tb_entity` (
  `id` int(11) NOT NULL,
  `name_company` varchar(100) DEFAULT '',
  `nick_trade` varchar(100) DEFAULT '',
  `aniversary` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `tb_line_business_id` int(11) DEFAULT NULL,
  `note` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_entity_has_entity`
--

CREATE TABLE `tb_entity_has_entity` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_entity_owner_id` int(11) NOT NULL,
  `tb_entity_child_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_entity_has_mailing`
--

CREATE TABLE `tb_entity_has_mailing` (
  `tb_entity_id` int(11) NOT NULL,
  `tb_mailing_id` int(11) NOT NULL,
  `tb_mailing_group_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_entity_seq`
--

CREATE TABLE `tb_entity_seq` (
  `id` int(11) NOT NULL,
  `used` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_financial`
--

CREATE TABLE `tb_financial` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `parcel` int(11) NOT NULL,
  `dt_expiration` date DEFAULT NULL,
  `tb_payment_types_id` int(11) NOT NULL,
  `tag_value` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_financial_bills`
--

CREATE TABLE `tb_financial_bills` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `parcel` int(11) NOT NULL,
  `tb_financial_plans_id` int(11) NOT NULL DEFAULT 0,
  `number` varchar(60) DEFAULT NULL,
  `kind` varchar(2) DEFAULT NULL,
  `situation` varchar(1) DEFAULT NULL,
  `operation` varchar(1) DEFAULT NULL,
  `stage` varchar(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_financial_payment`
--

CREATE TABLE `tb_financial_payment` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `parcel` int(11) NOT NULL,
  `interest_value` decimal(10,2) DEFAULT NULL,
  `late_value` decimal(10,2) DEFAULT NULL,
  `discount_aliquot` decimal(10,2) DEFAULT NULL,
  `paid_value` decimal(10,2) DEFAULT NULL,
  `dt_payment` date DEFAULT NULL,
  `dt_real_payment` date DEFAULT NULL,
  `settled` varchar(1) DEFAULT NULL,
  `tb_financial_plans_id` int(11) NOT NULL DEFAULT 0,
  `settled_code` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_financial_plans`
--

CREATE TABLE `tb_financial_plans` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `posit_level` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `source_` varchar(1) DEFAULT NULL,
  `kind` varchar(1) DEFAULT NULL,
  `cluster` varchar(1) DEFAULT NULL,
  `active` char(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_financial_statement`
--

CREATE TABLE `tb_financial_statement` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `tb_bank_account_id` int(11) NOT NULL,
  `dt_record` date DEFAULT NULL,
  `tb_bank_historic_id` int(11) NOT NULL,
  `credit_value` decimal(10,2) DEFAULT NULL,
  `debit_value` decimal(10,2) DEFAULT NULL,
  `manual_history` varchar(100) DEFAULT NULL,
  `kind` char(1) DEFAULT NULL,
  `settled_code` int(11) DEFAULT NULL,
  `tb_user_id` int(11) DEFAULT NULL,
  `future` char(1) DEFAULT NULL,
  `dt_original` date DEFAULT NULL,
  `doc_reference` char(30) DEFAULT NULL,
  `conferred` char(1) DEFAULT NULL,
  `tb_payment_types_id` int(11) DEFAULT NULL,
  `tb_financial_plans_id_cre` int(11) NOT NULL DEFAULT 0,
  `tb_financial_plans_id_deb` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_freight_mode`
--

CREATE TABLE `tb_freight_mode` (
  `id` char(1) NOT NULL DEFAULT '',
  `description` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_images`
--

CREATE TABLE `tb_images` (
  `tb_institution_id` int(11) NOT NULL,
  `album` varchar(50) NOT NULL DEFAULT 'ni',
  `file_name` varchar(100) NOT NULL DEFAULT '',
  `sequence` int(11) NOT NULL DEFAULT 0,
  `tb_entity_id` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_institution`
--

CREATE TABLE `tb_institution` (
  `id` int(11) NOT NULL,
  `active` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_institution_has_bank`
--

CREATE TABLE `tb_institution_has_bank` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_bank_id` int(11) NOT NULL,
  `active` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_institution_has_brand`
--

CREATE TABLE `tb_institution_has_brand` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_brand_id` int(11) NOT NULL,
  `active` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_institution_has_color`
--

CREATE TABLE `tb_institution_has_color` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_color_id` int(11) NOT NULL,
  `active` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_institution_has_entity`
--

CREATE TABLE `tb_institution_has_entity` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_entity_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_institution_has_linebusiness`
--

CREATE TABLE `tb_institution_has_linebusiness` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_linebusiness_id` int(11) NOT NULL,
  `active` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_institution_has_measure`
--

CREATE TABLE `tb_institution_has_measure` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_measure_id` int(11) NOT NULL,
  `active` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_institution_has_module`
--

CREATE TABLE `tb_institution_has_module` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_modules_id` int(11) NOT NULL,
  `active` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_institution_has_package`
--

CREATE TABLE `tb_institution_has_package` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_package_id` int(11) NOT NULL,
  `active` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_institution_has_payment_types`
--

CREATE TABLE `tb_institution_has_payment_types` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_payment_types_id` int(11) NOT NULL,
  `active` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_institution_has_user`
--

CREATE TABLE `tb_institution_has_user` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_user_id` int(11) NOT NULL,
  `kind` varchar(20) DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_interface`
--

CREATE TABLE `tb_interface` (
  `id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `kind` varchar(26) DEFAULT NULL,
  `position` varchar(10) DEFAULT 'NULL',
  `img_index` int(11) NOT NULL,
  `acao_botao` varchar(100) DEFAULT 'NULL',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_interface_has_privilege`
--

CREATE TABLE `tb_interface_has_privilege` (
  `tb_interface_id` int(11) NOT NULL,
  `tb_privilege_id` int(11) NOT NULL,
  `active` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_invoice`
--

CREATE TABLE `tb_invoice` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `issuer` int(11) NOT NULL,
  `kind_emis` varchar(50) DEFAULT NULL,
  `finality` varchar(2) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `serie` varchar(10) DEFAULT NULL,
  `tb_cfop_id` varchar(10) DEFAULT NULL,
  `tb_entity_id` int(11) NOT NULL,
  `dt_emission` date NOT NULL,
  `value` decimal(10,2) DEFAULT NULL,
  `model` varchar(2) DEFAULT NULL,
  `note` blob DEFAULT NULL,
  `status` char(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_invoice_has_purchase`
--

CREATE TABLE `tb_invoice_has_purchase` (
  `terminal` int(11) NOT NULL DEFAULT 0,
  `tb_institution_id` int(11) NOT NULL,
  `tb_invoice_id` int(11) NOT NULL,
  `tb_invoice_item_id` int(11) NOT NULL,
  `tb_order_purchase_id` int(11) NOT NULL,
  `tb_order_item_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_invoice_merchandise`
--

CREATE TABLE `tb_invoice_merchandise` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `dt_exit` date DEFAULT NULL,
  `tm_exit` time DEFAULT NULL,
  `base_icms_value` decimal(10,2) DEFAULT NULL,
  `icms_value` decimal(10,2) DEFAULT NULL,
  `base_icms_st_value` decimal(10,2) DEFAULT NULL,
  `icms_st_value` decimal(10,2) DEFAULT NULL,
  `total_value` decimal(10,2) DEFAULT NULL,
  `freight_value` decimal(10,2) DEFAULT NULL,
  `insurance_value` decimal(10,2) DEFAULT NULL,
  `expenses_value` decimal(10,2) DEFAULT NULL,
  `ipi_value` decimal(10,2) DEFAULT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `total_qtty` decimal(10,3) DEFAULT NULL,
  `indPres` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_invoice_obs`
--

CREATE TABLE `tb_invoice_obs` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `tb_invoice_id` int(11) NOT NULL,
  `obs` blob NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_invoice_rectification`
--

CREATE TABLE `tb_invoice_rectification` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL,
  `tb_invoice_id` int(11) NOT NULL,
  `dt_record` date DEFAULT NULL,
  `nr_key` varchar(50) DEFAULT NULL,
  `protocol` varchar(50) DEFAULT NULL,
  `tb_state_id` int(11) DEFAULT NULL,
  `sequencce` int(11) DEFAULT NULL,
  `note` blob DEFAULT NULL,
  `status_code` int(11) DEFAULT NULL,
  `motive` varchar(60) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_invoice_return_55`
--

CREATE TABLE `tb_invoice_return_55` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `number` varchar(10) DEFAULT NULL,
  `serie` varchar(10) DEFAULT NULL,
  `status_code` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `motive` varchar(60) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_invoice_return_65`
--

CREATE TABLE `tb_invoice_return_65` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL,
  `number` varchar(10) NOT NULL,
  `serie` varchar(10) NOT NULL,
  `nr_lot` int(11) NOT NULL,
  `synchronous` char(1) DEFAULT NULL,
  `emissi_type` char(1) DEFAULT NULL,
  `format_type` char(1) DEFAULT NULL,
  `presen_indi` char(1) DEFAULT NULL,
  `status_code` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `motive` varchar(60) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_invoice_return_service`
--

CREATE TABLE `tb_invoice_return_service` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL,
  `number` varchar(10) NOT NULL,
  `nr_rps` int(11) NOT NULL,
  `nr_lot` int(11) NOT NULL,
  `protocol` varchar(50) DEFAULT NULL,
  `code_verif` varchar(15) DEFAULT NULL,
  `kind` char(1) DEFAULT NULL,
  `synchronous` char(1) DEFAULT NULL,
  `status_code` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `motive` varchar(60) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_invoice_shipping`
--

CREATE TABLE `tb_invoice_shipping` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `total_qtty` decimal(10,3) DEFAULT NULL,
  `sort_tag` varchar(10) DEFAULT NULL,
  `brand_tag` varchar(10) DEFAULT NULL,
  `gross_weight` varchar(10) DEFAULT NULL,
  `net_weight` varchar(10) DEFAULT NULL,
  `volume_number` varchar(8) DEFAULT NULL,
  `vehicle_plaque` varchar(8) DEFAULT NULL,
  `state_plaque` varchar(2) DEFAULT NULL,
  `rntc_plaque` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_iteration`
--

CREATE TABLE `tb_iteration` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `detail` blob DEFAULT NULL,
  `kind` char(1) DEFAULT NULL,
  `tb_situation_id` int(11) DEFAULT NULL,
  `path_attachament` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `tb_customer_id` int(11) DEFAULT NULL,
  `tb_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_iteration_attachment`
--

CREATE TABLE `tb_iteration_attachment` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `tb_iteration_id` int(11) NOT NULL,
  `path_file` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_iteration_has_iteration`
--

CREATE TABLE `tb_iteration_has_iteration` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `tb_iteration_id_master` int(11) NOT NULL,
  `tb_iteration_id_detail` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_kickback`
--

CREATE TABLE `tb_kickback` (
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `tb_order_item_id` int(11) NOT NULL,
  `parcel` int(11) NOT NULL,
  `dt_record` date DEFAULT NULL,
  `tb_customer_id` int(11) NOT NULL,
  `tb_collaborator_id` int(11) NOT NULL,
  `historic` varchar(100) DEFAULT NULL,
  `base_value` decimal(10,2) DEFAULT NULL,
  `aliq` decimal(10,2) DEFAULT NULL,
  `vl_payment` decimal(10,2) DEFAULT NULL,
  `dt_payment` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_kind`
--

CREATE TABLE `tb_kind` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `detail` blob DEFAULT NULL,
  `cost_owner` char(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_linebusiness`
--

CREATE TABLE `tb_linebusiness` (
  `id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_log_operation`
--

CREATE TABLE `tb_log_operation` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_user_id` int(11) NOT NULL,
  `log_timestamp` datetime DEFAULT NULL,
  `log_interface` varchar(100) DEFAULT NULL,
  `log_operation` varchar(100) DEFAULT NULL,
  `log_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_mailing`
--

CREATE TABLE `tb_mailing` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_mailing_group`
--

CREATE TABLE `tb_mailing_group` (
  `id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_mailing_seq`
--

CREATE TABLE `tb_mailing_seq` (
  `id` int(11) NOT NULL,
  `used` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_measure`
--

CREATE TABLE `tb_measure` (
  `id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `abbreviation` varchar(3) DEFAULT NULL,
  `escale` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_med_copy_edition`
--

CREATE TABLE `tb_med_copy_edition` (
  `tb_broadcaster_id` int(11) DEFAULT NULL,
  `tb_city_id` int(11) DEFAULT NULL,
  `nr_copy` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_med_insert_date`
--

CREATE TABLE `tb_med_insert_date` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_med_parts_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `dt_insertion` date DEFAULT NULL,
  `week_day` varchar(20) DEFAULT NULL,
  `qt_insertion` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_med_material`
--

CREATE TABLE `tb_med_material` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `destiny` int(11) NOT NULL,
  `active` char(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_med_parts`
--

CREATE TABLE `tb_med_parts` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `tittle` varchar(30) DEFAULT NULL,
  `tb_med_material_id` int(11) NOT NULL,
  `tb_med_price_list_id` int(11) NOT NULL,
  `insertion` int(11) DEFAULT NULL,
  `nr_repetition` int(11) DEFAULT NULL,
  `table_value` decimal(10,2) DEFAULT NULL,
  `unit_value` decimal(10,2) DEFAULT NULL,
  `total_value` decimal(10,2) DEFAULT NULL,
  `aliq_desc` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_med_parts_jr`
--

CREATE TABLE `tb_med_parts_jr` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `nr_column` varchar(5) DEFAULT NULL,
  `nr_height` varchar(5) DEFAULT NULL,
  `color` varchar(3) DEFAULT NULL,
  `day` varchar(9) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_med_parts_rt`
--

CREATE TABLE `tb_med_parts_rt` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `tm_duration` varchar(10) DEFAULT 'NULL',
  `testimonial` varchar(3) DEFAULT NULL,
  `increase_testemonial` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_med_pos_prog`
--

CREATE TABLE `tb_med_pos_prog` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `active` char(1) NOT NULL DEFAULT 'S',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_med_price_list_jr`
--

CREATE TABLE `tb_med_price_list_jr` (
  `tb_institution_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `tb_broadcaster_id` int(11) NOT NULL,
  `tb_med_pos_prog_id` int(11) DEFAULT NULL,
  `week_day_value` decimal(10,2) DEFAULT NULL,
  `sun_day_value` decimal(10,2) DEFAULT NULL,
  `nr_columns` int(11) DEFAULT NULL,
  `addition` decimal(10,2) DEFAULT NULL,
  `size_columns` int(11) DEFAULT NULL,
  `formats` varchar(100) DEFAULT NULL,
  `measure` varchar(100) DEFAULT NULL,
  `path_file` varchar(255) DEFAULT NULL,
  `online_discount` decimal(10,2) DEFAULT NULL,
  `online_price` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_med_price_list_ol`
--

CREATE TABLE `tb_med_price_list_ol` (
  `tb_institution_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `tb_broadcaster_id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `formats` varchar(100) NOT NULL,
  `price_value` decimal(10,2) NOT NULL,
  `online_price` decimal(10,2) DEFAULT 0.00,
  `determination` int(5) NOT NULL,
  `expansible` int(5) NOT NULL,
  `daily` decimal(10,2) NOT NULL,
  `dimensions` varchar(50) NOT NULL,
  `position` int(11) NOT NULL,
  `pageview_min` int(11) DEFAULT NULL,
  `pageview_max` int(11) DEFAULT NULL,
  `note` blob DEFAULT NULL,
  `path_file` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_med_price_list_rt`
--

CREATE TABLE `tb_med_price_list_rt` (
  `tb_institution_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `tb_broadcaster_id` int(11) NOT NULL,
  `tb_med_pos_prog_id` int(11) DEFAULT NULL,
  `spot15_value` decimal(10,2) DEFAULT NULL,
  `spot30_value` decimal(10,2) DEFAULT NULL,
  `spot45_value` decimal(10,2) DEFAULT NULL,
  `spot60_value` decimal(10,2) DEFAULT NULL,
  `schedule` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_merchandise`
--

CREATE TABLE `tb_merchandise` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `id_internal` varchar(45) DEFAULT NULL,
  `id_provider` int(11) DEFAULT NULL,
  `ncm` varchar(8) DEFAULT NULL,
  `cest` varchar(7) DEFAULT NULL,
  `kind_tributary` char(1) DEFAULT NULL,
  `source` char(1) DEFAULT NULL,
  `kind` varchar(45) DEFAULT NULL,
  `tb_brand_id` int(11) NOT NULL,
  `print` char(1) DEFAULT NULL,
  `controlseries` varchar(1) DEFAULT NULL,
  `exclusive_dealer` char(1) DEFAULT NULL,
  `application` blob DEFAULT NULL,
  `composition` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_merchandise_has_provider`
--

CREATE TABLE `tb_merchandise_has_provider` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_merchandise_id` int(11) NOT NULL,
  `tb_provider_id` int(11) NOT NULL,
  `product_provider` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_merchandise_has_self`
--

CREATE TABLE `tb_merchandise_has_self` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_master_id` int(11) NOT NULL,
  `tb_detail_id` int(11) NOT NULL,
  `quantity` decimal(10,4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_module`
--

CREATE TABLE `tb_module` (
  `id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `technical_name` varchar(50) NOT NULL,
  `img_index` int(11) DEFAULT 0,
  `acao_botao` varchar(101) DEFAULT 'NULL',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_module_has_interface`
--

CREATE TABLE `tb_module_has_interface` (
  `tb_module_id` int(11) NOT NULL,
  `tb_interface_id` int(11) NOT NULL,
  `active` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_msg_return_nfe`
--

CREATE TABLE `tb_msg_return_nfe` (
  `id` int(11) NOT NULL,
  `kind` char(1) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `interno` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_mva_ncm`
--

CREATE TABLE `tb_mva_ncm` (
  `tb_state_id` int(11) NOT NULL,
  `ncm` varchar(8) NOT NULL,
  `mva` decimal(10,4) DEFAULT NULL,
  `aliq_icms` decimal(10,2) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_ncm`
--

CREATE TABLE `tb_ncm` (
  `number` varchar(10) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `exc` varchar(5) DEFAULT NULL,
  `tabela` int(11) DEFAULT NULL,
  `aliq_nac` decimal(10,3) DEFAULT NULL,
  `aliq_imp` decimal(10,3) DEFAULT NULL,
  `aliq_est` decimal(10,3) DEFAULT NULL,
  `aliq_mun` decimal(10,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_nfe_events`
--

CREATE TABLE `tb_nfe_events` (
  `id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_nfe_events_sent`
--

CREATE TABLE `tb_nfe_events_sent` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `number` varchar(15) DEFAULT NULL,
  `nfe_key` varchar(100) DEFAULT NULL,
  `tb_nfe_events_id` int(11) DEFAULT NULL,
  `dt_record` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Sequence` varchar(10) DEFAULT NULL,
  `justification` varchar(255) DEFAULT NULL,
  `status` varchar(3) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_observation`
--

CREATE TABLE `tb_observation` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `note` blob DEFAULT NULL,
  `general` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order`
--

CREATE TABLE `tb_order` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `tb_user_id` int(11) NOT NULL,
  `dt_record` date DEFAULT NULL,
  `note` blob DEFAULT NULL,
  `origin` char(1) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `being_used` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_billing`
--

CREATE TABLE `tb_order_billing` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `tb_payment_types_id` int(11) NOT NULL,
  `plots` varchar(3) DEFAULT NULL,
  `deadline` varchar(255) DEFAULT NULL,
  `task_owner` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_consignment`
--

CREATE TABLE `tb_order_consignment` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL,
  `tb_customer_id` int(11) NOT NULL,
  `tb_salesman_id` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_consignment_operation`
--

CREATE TABLE `tb_order_consignment_operation` (
  `tb_order_item_id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `dt_record` date DEFAULT NULL,
  `kind` varchar(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_cost`
--

CREATE TABLE `tb_order_cost` (
  `id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `tb_order_item_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `tb_product_id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `calc_basis` decimal(10,3) DEFAULT NULL,
  `method` char(1) DEFAULT NULL,
  `index_value` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_has_delivery`
--

CREATE TABLE `tb_order_has_delivery` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `tb_order_item_id` int(11) NOT NULL,
  `tb_order_to_deliver_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_has_production`
--

CREATE TABLE `tb_order_has_production` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `tb_order_item_id` int(11) NOT NULL,
  `tb_order_production_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_has_purchase`
--

CREATE TABLE `tb_order_has_purchase` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `tb_order_item_id` int(11) NOT NULL,
  `tb_order_to_buy_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_has_reserved`
--

CREATE TABLE `tb_order_has_reserved` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `tb_order_item_id` int(11) NOT NULL,
  `tb_stock_reserved_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_item`
--

CREATE TABLE `tb_order_item` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `tb_product_id` int(11) NOT NULL,
  `tb_stock_list_id` int(11) NOT NULL,
  `quantity` decimal(10,4) DEFAULT NULL,
  `unit_value` decimal(10,6) DEFAULT NULL,
  `discount_aliquot` decimal(10,2) DEFAULT NULL,
  `discount_value` decimal(10,6) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tb_price_list_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_item_cofins`
--

CREATE TABLE `tb_order_item_cofins` (
  `tb_order_id` int(11) NOT NULL,
  `tb_order_item_id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `cst` varchar(2) DEFAULT NULL,
  `base_value` decimal(15,2) DEFAULT NULL,
  `aliq_value` decimal(5,2) DEFAULT NULL,
  `tag_value` decimal(15,2) DEFAULT NULL,
  `qt_sale_qtty` decimal(16,4) DEFAULT NULL,
  `qt_aliq_value` decimal(15,4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_item_detached`
--

CREATE TABLE `tb_order_item_detached` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL,
  `nr_item` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `tb_measure_id` int(11) DEFAULT NULL,
  `parts_flavor` int(11) DEFAULT NULL,
  `quantity` decimal(10,4) DEFAULT NULL,
  `unit_value` decimal(10,6) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_item_detail`
--

CREATE TABLE `tb_order_item_detail` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL,
  `tb_order_item_id` int(11) DEFAULT NULL,
  `tb_order_item_detached_id` int(11) NOT NULL,
  `kind` varchar(50) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_item_detail_observation`
--

CREATE TABLE `tb_order_item_detail_observation` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL,
  `tb_order_item_detail_id` int(11) DEFAULT NULL,
  `tb_rest_group_has_observation_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_item_detail_optional`
--

CREATE TABLE `tb_order_item_detail_optional` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL,
  `tb_order_item_detail_id` int(11) NOT NULL,
  `tb_order_item_id` int(11) DEFAULT NULL,
  `tb_product_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_item_detail_remove`
--

CREATE TABLE `tb_order_item_detail_remove` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL,
  `tb_order_item_detail_id` int(11) DEFAULT NULL,
  `tb_product_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_item_flex`
--

CREATE TABLE `tb_order_item_flex` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `tb_salesman_id` int(11) NOT NULL DEFAULT 0,
  `original_value` decimal(10,4) DEFAULT 0.0000,
  `real_value` decimal(10,4) DEFAULT 0.0000,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_item_icms`
--

CREATE TABLE `tb_order_item_icms` (
  `tb_order_id` int(11) NOT NULL,
  `tb_order_item_id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `cst` varchar(3) DEFAULT NULL,
  `origem` char(1) DEFAULT NULL,
  `determ_base` char(1) DEFAULT NULL,
  `determ_base_st` char(1) DEFAULT NULL,
  `discharge` int(11) DEFAULT NULL,
  `aliq_rd_base` decimal(10,2) DEFAULT NULL,
  `base_value` decimal(10,6) DEFAULT NULL,
  `aliq` decimal(10,2) DEFAULT NULL,
  `aliq_rd` decimal(10,2) DEFAULT NULL,
  `value` decimal(10,6) DEFAULT NULL,
  `aliq_rd_base_st` decimal(10,2) DEFAULT NULL,
  `base_value_st` decimal(10,6) DEFAULT NULL,
  `aliq_st` decimal(10,2) DEFAULT NULL,
  `aliq_rd_st` decimal(10,2) DEFAULT NULL,
  `value_st` decimal(10,6) DEFAULT NULL,
  `mva` decimal(10,6) DEFAULT NULL,
  `withheld_base_value` decimal(10,6) DEFAULT NULL,
  `withheld_value` decimal(10,6) DEFAULT NULL,
  `withheld_base_value_st` decimal(10,6) DEFAULT NULL,
  `withheld_value_st` decimal(10,6) DEFAULT NULL,
  `sharing` char(1) DEFAULT NULL,
  `pass_through` char(1) DEFAULT NULL,
  `cred_calc_aliq` decimal(10,2) DEFAULT NULL,
  `cred_expl_value` decimal(10,6) DEFAULT NULL,
  `freight_value` decimal(10,2) DEFAULT NULL,
  `insurance_Value` decimal(10,2) DEFAULT NULL,
  `expenses_value` decimal(10,2) DEFAULT NULL,
  `tb_cfop_id` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_item_ii`
--

CREATE TABLE `tb_order_item_ii` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `tb_order_item_id` int(11) NOT NULL,
  `base_value` decimal(10,2) DEFAULT NULL,
  `customs_expense` decimal(10,2) DEFAULT NULL,
  `tag_value` decimal(10,2) DEFAULT NULL,
  `iof_value` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_item_ipi`
--

CREATE TABLE `tb_order_item_ipi` (
  `tb_order_id` int(11) NOT NULL,
  `tb_order_item_id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `cst` varchar(2) DEFAULT NULL,
  `class_frame` varchar(5) DEFAULT NULL,
  `producer_cnpj` varchar(14) DEFAULT NULL,
  `stamp_ctrl` varchar(60) DEFAULT NULL,
  `stamp_qtty` decimal(10,2) DEFAULT NULL,
  `class_frame_code` varchar(3) DEFAULT NULL,
  `base_value` decimal(15,2) DEFAULT NULL,
  `aliq_value` decimal(5,2) DEFAULT NULL,
  `unit_qtty` decimal(16,4) DEFAULT NULL,
  `unit_value` decimal(15,4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_item_issqn`
--

CREATE TABLE `tb_order_item_issqn` (
  `tb_order_id` int(11) NOT NULL,
  `tb_order_item_id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `base_value` decimal(10,2) DEFAULT NULL,
  `aliq_value` decimal(10,2) DEFAULT NULL,
  `tag_value` decimal(10,2) DEFAULT NULL,
  `listservice` varchar(50) DEFAULT NULL,
  `tax_code` varchar(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_item_job`
--

CREATE TABLE `tb_order_item_job` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `work_front` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_item_pis`
--

CREATE TABLE `tb_order_item_pis` (
  `tb_order_id` int(11) NOT NULL,
  `tb_order_item_id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `cst` varchar(2) DEFAULT NULL,
  `base_value` decimal(10,2) DEFAULT NULL,
  `aliq_value` decimal(10,2) DEFAULT NULL,
  `qt_sale_qtty` decimal(16,4) DEFAULT NULL,
  `qt_aliq_value` decimal(15,4) DEFAULT NULL,
  `tag_value` decimal(15,4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_job`
--

CREATE TABLE `tb_order_job` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `tb_customer_id` int(11) NOT NULL,
  `dt_start` date DEFAULT NULL,
  `dt_forecast` date DEFAULT NULL,
  `dt_end` date DEFAULT NULL,
  `cost_value` decimal(10,6) DEFAULT NULL,
  `tb_situation_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_job_scope`
--

CREATE TABLE `tb_order_job_scope` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `tb_work_front_id` int(11) NOT NULL,
  `note` blob DEFAULT NULL,
  `dt_forecast` date DEFAULT NULL,
  `value_forecast` decimal(10,6) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_packing`
--

CREATE TABLE `tb_order_packing` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `tb_entity_id` int(11) NOT NULL,
  `tb_situation_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_pi`
--

CREATE TABLE `tb_order_pi` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `nr_original` varchar(30) DEFAULT NULL,
  `dt_original` date DEFAULT NULL,
  `dt_expiration` date DEFAULT NULL,
  `nr_internal` int(11) DEFAULT NULL,
  `dt_internal` date DEFAULT NULL,
  `tb_agency_id` int(11) DEFAULT NULL,
  `tb_advertiser_id` int(11) DEFAULT NULL,
  `tb_broadcaster_id` int(11) DEFAULT NULL,
  `kickback_agency` decimal(10,2) DEFAULT NULL,
  `kickback_owner` decimal(10,2) DEFAULT NULL,
  `kind_calculation` int(11) DEFAULT NULL,
  `gross_value` decimal(10,2) DEFAULT NULL,
  `kickback_value` decimal(10,2) DEFAULT NULL,
  `net_value` decimal(10,2) DEFAULT NULL,
  `owner_value` decimal(10,2) DEFAULT NULL,
  `kind_media` int(11) DEFAULT NULL,
  `extra_note` blob DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_production`
--

CREATE TABLE `tb_order_production` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `number` int(11) DEFAULT NULL,
  `dt_start` date DEFAULT NULL,
  `dt_end` date DEFAULT NULL,
  `tb_merchandise_id` int(11) NOT NULL,
  `tb_situation_id` int(11) NOT NULL,
  `qtty_forecast` decimal(10,3) DEFAULT NULL,
  `tb_stock_list_id_ori` int(11) NOT NULL,
  `tb_stock_list_id_des` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_production_mp`
--

CREATE TABLE `tb_order_production_mp` (
  `terminal` int(11) NOT NULL DEFAULT 0,
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `tb_product_id` int(11) NOT NULL,
  `tb_stock_list_id` int(11) NOT NULL,
  `kind` char(1) DEFAULT NULL,
  `quantity` decimal(10,4) DEFAULT NULL,
  `unit_value` decimal(10,6) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_production_pa`
--

CREATE TABLE `tb_order_production_pa` (
  `terminal` int(11) NOT NULL DEFAULT 0,
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `tb_product_id` int(11) NOT NULL,
  `tb_stock_list_id` int(11) NOT NULL,
  `quantity` decimal(10,4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_purchase`
--

CREATE TABLE `tb_order_purchase` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `number` int(11) DEFAULT NULL,
  `tb_provider_id` int(11) NOT NULL,
  `approved` char(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_sale`
--

CREATE TABLE `tb_order_sale` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `tb_salesman_id` int(11) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `tb_customer_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_shipping`
--

CREATE TABLE `tb_order_shipping` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `tb_carrier_id` int(11) NOT NULL,
  `kind` varchar(45) DEFAULT NULL,
  `tb_freight_mode_id` char(1) DEFAULT NULL,
  `tb_address_id` int(11) DEFAULT NULL,
  `help_reference` varchar(100) DEFAULT 'NULL',
  `delivery_date` datetime DEFAULT NULL,
  `value` decimal(10,6) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_stock_adjust`
--

CREATE TABLE `tb_order_stock_adjust` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `tb_entity_id` int(11) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_stock_transfer`
--

CREATE TABLE `tb_order_stock_transfer` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `tb_entity_id` int(11) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `tb_situation_id` int(11) NOT NULL,
  `tb_stock_list_id_ori` int(11) NOT NULL,
  `tb_stock_list_id_des` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_totalizer`
--

CREATE TABLE `tb_order_totalizer` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `items_qtde` int(11) NOT NULL,
  `product_qtde` decimal(10,3) DEFAULT NULL,
  `product_value` decimal(10,3) DEFAULT NULL,
  `IPI_value` decimal(10,3) DEFAULT NULL,
  `discount_aliquot` decimal(10,3) DEFAULT NULL,
  `discount_value` decimal(10,2) DEFAULT NULL,
  `expenses_value` decimal(10,2) DEFAULT NULL,
  `total_value` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_to_buy`
--

CREATE TABLE `tb_order_to_buy` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `tb_order_item_id` int(11) NOT NULL,
  `tb_product_id` int(11) NOT NULL,
  `dt_record` date NOT NULL,
  `quantity` decimal(10,4) NOT NULL,
  `status` char(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_to_deliver`
--

CREATE TABLE `tb_order_to_deliver` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `tb_order_item_id` int(11) NOT NULL,
  `tb_product_id` int(11) NOT NULL,
  `tb_stock_list_id` int(11) NOT NULL,
  `dt_record` date NOT NULL,
  `quantity` decimal(10,4) NOT NULL,
  `refer_doc` varchar(25) NOT NULL,
  `status` char(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_order_to_production`
--

CREATE TABLE `tb_order_to_production` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `tb_order_item_id` int(11) NOT NULL,
  `tb_product_id` int(11) NOT NULL,
  `dt_record` date NOT NULL,
  `quantity` decimal(10,4) NOT NULL,
  `status` char(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_package`
--

CREATE TABLE `tb_package` (
  `id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `abbreviation` varchar(3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_partnership`
--

CREATE TABLE `tb_partnership` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `dt_record` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_partnership_customer`
--

CREATE TABLE `tb_partnership_customer` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_customer` int(11) NOT NULL,
  `tb_partnership_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_partnership_partner`
--

CREATE TABLE `tb_partnership_partner` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_partnership_id` int(11) NOT NULL,
  `tb_collaborator_id` int(11) NOT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_payment_types`
--

CREATE TABLE `tb_payment_types` (
  `id` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_person`
--

CREATE TABLE `tb_person` (
  `id` int(11) NOT NULL,
  `cpf` char(11) NOT NULL,
  `rg` char(20) DEFAULT NULL,
  `rg_dt_emission` date DEFAULT NULL,
  `rg_organ_issuer` varchar(45) DEFAULT NULL,
  `rg_state_issuer` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `tb_profession_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_phone`
--

CREATE TABLE `tb_phone` (
  `id` int(11) NOT NULL DEFAULT 0,
  `kind` varchar(20) NOT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `address_kind` varchar(100) DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_price`
--

CREATE TABLE `tb_price` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_price_list_id` int(11) NOT NULL,
  `tb_product_id` int(11) NOT NULL,
  `price_tag` decimal(13,6) DEFAULT NULL,
  `aliq_profit` decimal(10,3) DEFAULT NULL,
  `aliq_kickback` decimal(10,2) DEFAULT NULL,
  `quantity` decimal(10,3) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_price_list`
--

CREATE TABLE `tb_price_list` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `description` varchar(45) NOT NULL,
  `validity` date DEFAULT NULL,
  `modality` varchar(1) DEFAULT NULL,
  `aliq_profit` decimal(10,0) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_priority`
--

CREATE TABLE `tb_priority` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_privilege`
--

CREATE TABLE `tb_privilege` (
  `id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_product`
--

CREATE TABLE `tb_product` (
  `id` int(11) NOT NULL DEFAULT 0,
  `identifier` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `tb_institution_id` int(11) NOT NULL DEFAULT 0,
  `description` varchar(100) COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `tb_category_id` int(11) NOT NULL DEFAULT 0,
  `tb_financial_plans_id` int(11) DEFAULT NULL,
  `promotion` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `highlights` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `active` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `published` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `note` blob DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_progress`
--

CREATE TABLE `tb_progress` (
  `tb_iteration_id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `tb_performer_id` int(11) NOT NULL,
  `dt_initi` datetime DEFAULT NULL,
  `dt_final` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_project`
--

CREATE TABLE `tb_project` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `dt_record` date DEFAULT NULL,
  `tb_entity_id` int(11) NOT NULL,
  `tb_situation_id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `detail` blob DEFAULT NULL,
  `dt_initi_forecast` date DEFAULT NULL,
  `dt_final_forecast` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_proj_log_changes`
--

CREATE TABLE `tb_proj_log_changes` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_project_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `dt_record` date DEFAULT NULL,
  `desc_interface` varchar(100) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_promotion`
--

CREATE TABLE `tb_promotion` (
  `tb_institution_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `price_tag` decimal(10,6) DEFAULT NULL,
  `quantity` decimal(10,3) DEFAULT NULL,
  `reg_active` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `oper` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_promotion_items`
--

CREATE TABLE `tb_promotion_items` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_promotion_id` int(11) NOT NULL,
  `tb_product_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `oper` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_proposal`
--

CREATE TABLE `tb_proposal` (
  `tb_iteration_id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `forecast_time` time DEFAULT NULL,
  `tag_value` decimal(10,2) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_provider`
--

CREATE TABLE `tb_provider` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `active` char(1) NOT NULL DEFAULT 'N',
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_provisional_receipt_service`
--

CREATE TABLE `tb_provisional_receipt_service` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `terminal` int(11) NOT NULL,
  `dt_record` date DEFAULT NULL,
  `number` int(11) NOT NULL DEFAULT 0,
  `nr_lot` int(11) DEFAULT NULL,
  `protocol` varchar(50) DEFAULT NULL,
  `note` blob DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_rest_group`
--

CREATE TABLE `tb_rest_group` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `sequence_id` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_rest_group_has_attribute`
--

CREATE TABLE `tb_rest_group_has_attribute` (
  `id` int(11) NOT NULL,
  `tb_rest_group_id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `kind` varchar(25) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `price_tag` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_rest_group_has_measure`
--

CREATE TABLE `tb_rest_group_has_measure` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_rest_group_id` int(11) NOT NULL,
  `tb_measure_id` int(11) NOT NULL,
  `parts` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_rest_group_has_observation`
--

CREATE TABLE `tb_rest_group_has_observation` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_rest_group_id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_rest_group_has_optional`
--

CREATE TABLE `tb_rest_group_has_optional` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_rest_group_id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `price_tag` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_rest_menu`
--

CREATE TABLE `tb_rest_menu` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_rest_menu_has_button`
--

CREATE TABLE `tb_rest_menu_has_button` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_rest_menu_id` int(11) NOT NULL,
  `tb_button_id` int(11) NOT NULL,
  `active` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_rest_menu_has_ingredient`
--

CREATE TABLE `tb_rest_menu_has_ingredient` (
  `tb_rest_menu_id` int(11) NOT NULL,
  `tb_product_id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `active` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_rest_menu_has_product`
--

CREATE TABLE `tb_rest_menu_has_product` (
  `tb_rest_menu_id` int(11) NOT NULL,
  `tb_product_id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `active` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_rest_subgroup`
--

CREATE TABLE `tb_rest_subgroup` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_rest_group_id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_salesman`
--

CREATE TABLE `tb_salesman` (
  `id` int(11) NOT NULL DEFAULT 0,
  `tb_institution_id` int(11) NOT NULL DEFAULT 0,
  `active` char(1) NOT NULL DEFAULT 'N',
  `aliq_kickback` decimal(10,2) DEFAULT NULL,
  `kickback_product` varchar(1) DEFAULT NULL,
  `flex_value` decimal(10,2) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_salesman_has_state`
--

CREATE TABLE `tb_salesman_has_state` (
  `tb_institution_id` int(11) NOT NULL DEFAULT 0,
  `tb_salesman_id` int(11) NOT NULL DEFAULT 0,
  `tb_state_id` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_salesman_has_stock`
--

CREATE TABLE `tb_salesman_has_stock` (
  `tb_institution_id` int(11) NOT NULL DEFAULT 0,
  `tb_salesman_id` int(11) NOT NULL DEFAULT 0,
  `tb_stock_id` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_shipping`
--

CREATE TABLE `tb_shipping` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `tb_haulier_id` int(11) NOT NULL,
  `kind` varchar(45) DEFAULT NULL,
  `accountable` int(11) DEFAULT NULL,
  `value` decimal(10,6) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_situation`
--

CREATE TABLE `tb_situation` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `modulo` varchar(50) NOT NULL,
  `flag_01` char(1) DEFAULT NULL,
  `flag_02` char(1) DEFAULT NULL,
  `flag_03` char(1) DEFAULT NULL,
  `flag_04` char(1) DEFAULT NULL,
  `active` varchar(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_social_media`
--

CREATE TABLE `tb_social_media` (
  `id` int(11) NOT NULL,
  `kind` varchar(50) NOT NULL,
  `link` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_state`
--

CREATE TABLE `tb_state` (
  `id` int(11) NOT NULL,
  `tb_country_id` int(11) NOT NULL,
  `abbreviation` varchar(2) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_stock`
--

CREATE TABLE `tb_stock` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_merchandise_id` int(11) NOT NULL DEFAULT 0,
  `tb_package_id` int(11) NOT NULL,
  `tb_measure_id` int(11) DEFAULT NULL,
  `tb_color_id` int(11) DEFAULT NULL,
  `codebar` varchar(20) DEFAULT NULL,
  `st` char(1) NOT NULL DEFAULT 'N',
  `quantity` decimal(10,4) DEFAULT NULL,
  `minimum` decimal(10,4) DEFAULT NULL,
  `divisor` int(11) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `weight` decimal(10,4) DEFAULT NULL,
  `width` decimal(10,4) DEFAULT NULL,
  `length` decimal(10,4) DEFAULT NULL,
  `height` decimal(10,4) DEFAULT NULL,
  `cost_manufactures` decimal(10,4) DEFAULT NULL,
  `actual_cost` decimal(10,4) DEFAULT NULL,
  `cost_price` decimal(10,4) DEFAULT NULL,
  `negative` char(1) DEFAULT NULL,
  `outline` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_stock_balance`
--

CREATE TABLE `tb_stock_balance` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_stock_list_id` int(11) NOT NULL,
  `tb_merchandise_id` int(11) NOT NULL,
  `quantity` decimal(10,4) DEFAULT NULL,
  `minimum` decimal(10,4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_stock_list`
--

CREATE TABLE `tb_stock_list` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `kind` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `terminal` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_stock_reserved`
--

CREATE TABLE `tb_stock_reserved` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_stock_list_id` int(11) NOT NULL,
  `tb_merchandise_id` int(11) NOT NULL,
  `dt_record` date NOT NULL,
  `quantity` decimal(10,6) NOT NULL,
  `status` char(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_stock_statement`
--

CREATE TABLE `tb_stock_statement` (
  `id` int(11) NOT NULL DEFAULT 0,
  `tb_institution_id` int(11) NOT NULL DEFAULT 0,
  `terminal` int(11) NOT NULL DEFAULT 0,
  `tb_order_id` int(11) NOT NULL DEFAULT 0,
  `tb_order_item_id` int(11) NOT NULL DEFAULT 0,
  `tb_stock_list_id` int(11) NOT NULL DEFAULT 0,
  `local` varchar(25) DEFAULT NULL,
  `kind` varchar(25) DEFAULT NULL,
  `dt_record` date DEFAULT NULL,
  `direction` varchar(1) DEFAULT NULL,
  `tb_merchandise_id` int(11) DEFAULT NULL,
  `quantity` decimal(10,4) DEFAULT NULL,
  `operation` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_task`
--

CREATE TABLE `tb_task` (
  `tb_iteration_id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_order_id` int(11) NOT NULL,
  `tb_project_id` int(11) NOT NULL,
  `tb_performer_id` int(11) NOT NULL,
  `dt_initi` datetime DEFAULT NULL,
  `dt_final` datetime DEFAULT NULL,
  `tb_priority_id` int(11) DEFAULT NULL,
  `tb_kind_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tax_cofins`
--

CREATE TABLE `tb_tax_cofins` (
  `id` char(2) NOT NULL DEFAULT '',
  `description` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tax_icms_nr`
--

CREATE TABLE `tb_tax_icms_nr` (
  `id` char(2) NOT NULL DEFAULT '',
  `description` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tax_icms_sn`
--

CREATE TABLE `tb_tax_icms_sn` (
  `id` char(3) NOT NULL DEFAULT '',
  `description` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tax_ipi`
--

CREATE TABLE `tb_tax_ipi` (
  `id` char(2) NOT NULL DEFAULT '',
  `description` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tax_pis`
--

CREATE TABLE `tb_tax_pis` (
  `id` char(2) NOT NULL DEFAULT '',
  `description` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tax_ruler`
--

CREATE TABLE `tb_tax_ruler` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `tb_product_id` int(11) NOT NULL,
  `origem` char(1) DEFAULT NULL,
  `tb_tax_icms_nr_id` char(2) NOT NULL,
  `tb_tax_icms_sn_id` char(3) NOT NULL,
  `tb_deter_base_tax_icms_id` char(2) DEFAULT NULL,
  `tb_deter_base_tax_icms_st_id` char(2) DEFAULT NULL,
  `tb_discharge_icms_id` int(11) DEFAULT NULL,
  `icms_aliq` decimal(10,2) DEFAULT NULL,
  `icms_aliq_reduced` decimal(10,2) DEFAULT NULL,
  `icms_base_reduced` decimal(10,2) DEFAULT NULL,
  `tb_tax_ipi_id` char(2) DEFAULT NULL,
  `ipi_aliq` decimal(10,2) DEFAULT NULL,
  `tb_tax_pis_id` char(2) DEFAULT NULL,
  `pis_aliq` decimal(10,2) DEFAULT NULL,
  `tb_tax_cofins_id` char(2) DEFAULT NULL,
  `cofins_aliq` decimal(10,2) DEFAULT NULL,
  `irrj_aliq` decimal(10,2) DEFAULT NULL,
  `csll_aqli` decimal(10,2) DEFAULT NULL,
  `ii_aliq` decimal(10,2) DEFAULT NULL,
  `for_icms_st` char(1) DEFAULT NULL,
  `for_consumer` char(1) DEFAULT NULL,
  `crt` varchar(3) DEFAULT NULL,
  `tb_observation_id` int(11) DEFAULT NULL,
  `tb_cfop_id` varchar(10) DEFAULT NULL,
  `tb_state_id` int(11) DEFAULT NULL,
  `tax_substitute` varchar(1) DEFAULT NULL,
  `transaction_kind` char(1) DEFAULT NULL,
  `afrmm_aliq` decimal(10,5) DEFAULT NULL,
  `siscomex_aliq` decimal(10,5) DEFAULT NULL,
  `ncm` varchar(8) DEFAULT NULL,
  `propag_base_reduc` char(1) DEFAULT NULL,
  `direction` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `kind` varchar(20) NOT NULL DEFAULT 'sistema',
  `salt` varchar(255) DEFAULT NULL,
  `tb_device_id` int(11) NOT NULL DEFAULT 0,
  `active` char(1) NOT NULL DEFAULT 'S',
  `activation_key` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_user_has_privilege`
--

CREATE TABLE `tb_user_has_privilege` (
  `tb_institution_id` int(11) NOT NULL,
  `tb_user_id` int(11) NOT NULL,
  `tb_interface_id` int(11) NOT NULL,
  `tb_privilege_id` int(11) NOT NULL,
  `active` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_user_send_email`
--

CREATE TABLE `tb_user_send_email` (
  `tb_user_id` int(11) NOT NULL,
  `smtp` varchar(100) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL,
  `pass_word` varchar(100) DEFAULT NULL,
  `req_auth` char(1) DEFAULT NULL,
  `req_ssl` char(1) DEFAULT NULL,
  `notify_access` char(1) DEFAULT NULL,
  `signature` blob DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_work_front`
--

CREATE TABLE `tb_work_front` (
  `id` int(11) NOT NULL,
  `tb_institution_id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tutorial`
--

CREATE TABLE `tutorial` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `published` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tutorials`
--

CREATE TABLE `tutorials` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `published` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_address`
--
ALTER TABLE `tb_address`
  ADD PRIMARY KEY (`id`,`kind`),
  ADD KEY `fk_country_to_address` (`tb_country_id`),
  ADD KEY `fk_state_to_address` (`tb_state_id`),
  ADD KEY `fk_city_to_address` (`tb_city_id`);

--
-- Índices para tabela `tb_advertiser`
--
ALTER TABLE `tb_advertiser`
  ADD PRIMARY KEY (`id`,`tb_institution_id`),
  ADD KEY `tb_institution_id` (`tb_institution_id`);

--
-- Índices para tabela `tb_agency`
--
ALTER TABLE `tb_agency`
  ADD PRIMARY KEY (`id`,`tb_institution_id`),
  ADD KEY `tb_institution_id` (`tb_institution_id`);

--
-- Índices para tabela `tb_bank`
--
ALTER TABLE `tb_bank`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`);

--
-- Índices para tabela `tb_bank_account`
--
ALTER TABLE `tb_bank_account`
  ADD PRIMARY KEY (`id`,`tb_institution_id`),
  ADD KEY `updated_at` (`updated_at`);

--
-- Índices para tabela `tb_bank_charge_kind`
--
ALTER TABLE `tb_bank_charge_kind`
  ADD PRIMARY KEY (`id`,`tb_bank_id`);

--
-- Índices para tabela `tb_bank_charge_slip`
--
ALTER TABLE `tb_bank_charge_slip`
  ADD PRIMARY KEY (`id`,`tb_institution_id`);

--
-- Índices para tabela `tb_bank_charge_ticket`
--
ALTER TABLE `tb_bank_charge_ticket`
  ADD PRIMARY KEY (`id`,`tb_bank_id`,`number`);

--
-- Índices para tabela `tb_bank_historic`
--
ALTER TABLE `tb_bank_historic`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_bank_id`);

--
-- Índices para tabela `tb_brand`
--
ALTER TABLE `tb_brand`
  ADD PRIMARY KEY (`id`),
  ADD KEY `updated_at` (`updated_at`);

--
-- Índices para tabela `tb_broadcaster`
--
ALTER TABLE `tb_broadcaster`
  ADD PRIMARY KEY (`id`,`tb_institution_id`),
  ADD KEY `tb_institution_id` (`tb_institution_id`);

--
-- Índices para tabela `tb_broadcaster_has_circulation`
--
ALTER TABLE `tb_broadcaster_has_circulation`
  ADD PRIMARY KEY (`tb_broadcaster_id`,`tb_city_id`),
  ADD KEY `tb_city_id` (`tb_city_id`);

--
-- Índices para tabela `tb_budg_advertise`
--
ALTER TABLE `tb_budg_advertise`
  ADD PRIMARY KEY (`id`,`tb_institution_id`);

--
-- Índices para tabela `tb_budg_advertise_imp`
--
ALTER TABLE `tb_budg_advertise_imp`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_budg_advertise_id`),
  ADD KEY `tb_broadcaster_id` (`tb_broadcaster_id`),
  ADD KEY `tb_city_id` (`tb_city_id`);

--
-- Índices para tabela `tb_budg_advertise_web`
--
ALTER TABLE `tb_budg_advertise_web`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_budg_advertise_id`),
  ADD KEY `tb_broadcaster_id` (`tb_broadcaster_id`),
  ADD KEY `tb_city_id` (`tb_city_id`);

--
-- Índices para tabela `tb_button`
--
ALTER TABLE `tb_button`
  ADD PRIMARY KEY (`id`,`tb_institution_id`);

--
-- Índices para tabela `tb_carrier`
--
ALTER TABLE `tb_carrier`
  ADD PRIMARY KEY (`id`,`tb_institution_id`),
  ADD KEY `tb_carrier_ibfk_2` (`tb_institution_id`);

--
-- Índices para tabela `tb_cashier`
--
ALTER TABLE `tb_cashier`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`terminal`);

--
-- Índices para tabela `tb_cashier_items`
--
ALTER TABLE `tb_cashier_items`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`terminal`,`tb_cashier_id`);

--
-- Índices para tabela `tb_category`
--
ALTER TABLE `tb_category`
  ADD PRIMARY KEY (`id`,`tb_institution_id`),
  ADD KEY `tb_category_ibfk_1` (`tb_institution_id`),
  ADD KEY `updated_at` (`updated_at`);

--
-- Índices para tabela `tb_cest`
--
ALTER TABLE `tb_cest`
  ADD PRIMARY KEY (`cest`);

--
-- Índices para tabela `tb_cfop`
--
ALTER TABLE `tb_cfop`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_cfop_to_cfop`
--
ALTER TABLE `tb_cfop_to_cfop`
  ADD PRIMARY KEY (`tb_cfop_id_ori`);

--
-- Índices para tabela `tb_city`
--
ALTER TABLE `tb_city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_city_to_state` (`tb_state_id`);

--
-- Índices para tabela `tb_clin_answer`
--
ALTER TABLE `tb_clin_answer`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_clin_quiz_id`,`tb_clin_questionnaire_id`,`tb_clin_question_id`),
  ADD KEY `tb_clin_answer_ibfk_1` (`tb_clin_quiz_id`),
  ADD KEY `tb_clin_answer_ibfk_2` (`tb_clin_questionnaire_id`),
  ADD KEY `tb_clin_answer_ibfk_3` (`tb_clin_question_id`);

--
-- Índices para tabela `tb_clin_module`
--
ALTER TABLE `tb_clin_module`
  ADD PRIMARY KEY (`id`,`tb_institution_id`);

--
-- Índices para tabela `tb_clin_patient`
--
ALTER TABLE `tb_clin_patient`
  ADD PRIMARY KEY (`id`,`tb_institution_id`);

--
-- Índices para tabela `tb_clin_professional`
--
ALTER TABLE `tb_clin_professional`
  ADD PRIMARY KEY (`id`,`tb_institution_id`);

--
-- Índices para tabela `tb_clin_professional_has_patient`
--
ALTER TABLE `tb_clin_professional_has_patient`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_clin_professional_id`,`tb_clin_patient_id`);

--
-- Índices para tabela `tb_clin_question`
--
ALTER TABLE `tb_clin_question`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_clin_questionnaire_id`),
  ADD KEY `tb_questionnaire_id` (`tb_clin_questionnaire_id`);

--
-- Índices para tabela `tb_clin_questionnaire`
--
ALTER TABLE `tb_clin_questionnaire`
  ADD PRIMARY KEY (`id`,`tb_institution_id`),
  ADD KEY `tb_institutiion_id` (`tb_institution_id`,`tb_clin_module_id`),
  ADD KEY `tb_clin_module_id` (`tb_clin_module_id`);

--
-- Índices para tabela `tb_clin_quiz`
--
ALTER TABLE `tb_clin_quiz`
  ADD PRIMARY KEY (`id`,`tb_institution_id`),
  ADD KEY `tb_cli_modulo_id` (`tb_clin_module_id`),
  ADD KEY `tb_questionnaire_id` (`tb_clin_questionnaire_id`),
  ADD KEY `tb_clin_professional_id` (`tb_clin_professional_id`),
  ADD KEY `tb_clin_patient_id` (`tb_clin_patient_id`);

--
-- Índices para tabela `tb_collaborator`
--
ALTER TABLE `tb_collaborator`
  ADD PRIMARY KEY (`id`,`tb_institution_id`);

--
-- Índices para tabela `tb_color`
--
ALTER TABLE `tb_color`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_company`
--
ALTER TABLE `tb_company`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cnpj` (`cnpj`);

--
-- Índices para tabela `tb_config`
--
ALTER TABLE `tb_config`
  ADD PRIMARY KEY (`tb_institution_id`,`field`);

--
-- Índices para tabela `tb_config_nfe`
--
ALTER TABLE `tb_config_nfe`
  ADD PRIMARY KEY (`tb_institution_id`);

--
-- Índices para tabela `tb_config_nfe_55`
--
ALTER TABLE `tb_config_nfe_55`
  ADD PRIMARY KEY (`tb_institution_id`);

--
-- Índices para tabela `tb_config_nfe_65`
--
ALTER TABLE `tb_config_nfe_65`
  ADD PRIMARY KEY (`tb_institution_id`);

--
-- Índices para tabela `tb_contact`
--
ALTER TABLE `tb_contact`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_entity_owner_id`);

--
-- Índices para tabela `tb_country`
--
ALTER TABLE `tb_country`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_crashlytics`
--
ALTER TABLE `tb_crashlytics`
  ADD PRIMARY KEY (`id`,`tb_institution_id`);

--
-- Índices para tabela `tb_customer`
--
ALTER TABLE `tb_customer`
  ADD PRIMARY KEY (`id`,`tb_institution_id`),
  ADD KEY `tb_institution_id` (`tb_institution_id`),
  ADD KEY `updated_at` (`updated_at`);

--
-- Índices para tabela `tb_deter_base_tax_icms`
--
ALTER TABLE `tb_deter_base_tax_icms`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_deter_base_tax_icms_st`
--
ALTER TABLE `tb_deter_base_tax_icms_st`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_devices`
--
ALTER TABLE `tb_devices`
  ADD PRIMARY KEY (`id`,`tb_institution_id`);

--
-- Índices para tabela `tb_discharge_icms`
--
ALTER TABLE `tb_discharge_icms`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_entity`
--
ALTER TABLE `tb_entity`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_entity_has_entity`
--
ALTER TABLE `tb_entity_has_entity`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_entity_owner_id`,`tb_entity_child_id`);

--
-- Índices para tabela `tb_entity_has_mailing`
--
ALTER TABLE `tb_entity_has_mailing`
  ADD PRIMARY KEY (`tb_entity_id`,`tb_mailing_id`,`tb_mailing_group_id`),
  ADD KEY `tb_mailing_id` (`tb_mailing_id`),
  ADD KEY `tb_mailing_group_id` (`tb_mailing_group_id`);

--
-- Índices para tabela `tb_entity_seq`
--
ALTER TABLE `tb_entity_seq`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_financial`
--
ALTER TABLE `tb_financial`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_order_id`,`terminal`,`parcel`),
  ADD KEY `tb_order_id` (`tb_order_id`);

--
-- Índices para tabela `tb_financial_bills`
--
ALTER TABLE `tb_financial_bills`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_order_id`,`terminal`,`parcel`),
  ADD KEY `tb_order_id` (`tb_order_id`);

--
-- Índices para tabela `tb_financial_payment`
--
ALTER TABLE `tb_financial_payment`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_order_id`,`terminal`,`parcel`),
  ADD KEY `tb_order_id` (`tb_order_id`);

--
-- Índices para tabela `tb_financial_plans`
--
ALTER TABLE `tb_financial_plans`
  ADD PRIMARY KEY (`id`,`tb_institution_id`),
  ADD KEY `source_` (`source_`),
  ADD KEY `kind` (`kind`);

--
-- Índices para tabela `tb_financial_statement`
--
ALTER TABLE `tb_financial_statement`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`terminal`);

--
-- Índices para tabela `tb_freight_mode`
--
ALTER TABLE `tb_freight_mode`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_images`
--
ALTER TABLE `tb_images`
  ADD PRIMARY KEY (`tb_institution_id`,`album`,`file_name`);

--
-- Índices para tabela `tb_institution`
--
ALTER TABLE `tb_institution`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_institution_has_brand`
--
ALTER TABLE `tb_institution_has_brand`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_brand_id`),
  ADD KEY `tb_brand_id` (`tb_brand_id`),
  ADD KEY `updated_at` (`updated_at`);

--
-- Índices para tabela `tb_institution_has_color`
--
ALTER TABLE `tb_institution_has_color`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_color_id`),
  ADD KEY `tb_color_id` (`tb_color_id`);

--
-- Índices para tabela `tb_institution_has_entity`
--
ALTER TABLE `tb_institution_has_entity`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_entity_id`),
  ADD KEY `tb_entity_id` (`tb_entity_id`);

--
-- Índices para tabela `tb_institution_has_linebusiness`
--
ALTER TABLE `tb_institution_has_linebusiness`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_linebusiness_id`),
  ADD KEY `tb_institution_has_linebusiness_ibfk_1` (`tb_linebusiness_id`);

--
-- Índices para tabela `tb_institution_has_measure`
--
ALTER TABLE `tb_institution_has_measure`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_measure_id`),
  ADD KEY `tb_measure_id` (`tb_measure_id`),
  ADD KEY `updated_at` (`updated_at`);

--
-- Índices para tabela `tb_institution_has_module`
--
ALTER TABLE `tb_institution_has_module`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_modules_id`),
  ADD KEY `tb_modules_id` (`tb_modules_id`),
  ADD KEY `tb_institution_id` (`tb_institution_id`),
  ADD KEY `active` (`active`);

--
-- Índices para tabela `tb_institution_has_package`
--
ALTER TABLE `tb_institution_has_package`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_package_id`),
  ADD KEY `tb_package_id` (`tb_package_id`),
  ADD KEY `updated_at` (`updated_at`);

--
-- Índices para tabela `tb_institution_has_payment_types`
--
ALTER TABLE `tb_institution_has_payment_types`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_payment_types_id`),
  ADD KEY `tb_payment_types_id` (`tb_payment_types_id`),
  ADD KEY `updated_at` (`updated_at`);

--
-- Índices para tabela `tb_institution_has_user`
--
ALTER TABLE `tb_institution_has_user`
  ADD PRIMARY KEY (`tb_user_id`,`tb_institution_id`),
  ADD KEY `tb_institution_id` (`tb_institution_id`),
  ADD KEY `updated_at` (`updated_at`);

--
-- Índices para tabela `tb_interface`
--
ALTER TABLE `tb_interface`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position` (`position`),
  ADD KEY `kind` (`kind`);

--
-- Índices para tabela `tb_interface_has_privilege`
--
ALTER TABLE `tb_interface_has_privilege`
  ADD PRIMARY KEY (`tb_interface_id`,`tb_privilege_id`),
  ADD KEY `tb_privilege_id` (`tb_privilege_id`);

--
-- Índices para tabela `tb_invoice`
--
ALTER TABLE `tb_invoice`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`terminal`),
  ADD KEY `tb_cfop_id` (`tb_cfop_id`),
  ADD KEY `tb_entity_id` (`tb_entity_id`),
  ADD KEY `tb_institution_id` (`tb_institution_id`);

--
-- Índices para tabela `tb_invoice_has_purchase`
--
ALTER TABLE `tb_invoice_has_purchase`
  ADD PRIMARY KEY (`terminal`,`tb_institution_id`,`tb_invoice_id`,`tb_invoice_item_id`,`tb_order_purchase_id`,`tb_order_item_id`);

--
-- Índices para tabela `tb_invoice_merchandise`
--
ALTER TABLE `tb_invoice_merchandise`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`terminal`),
  ADD KEY `tb_institution_id` (`tb_institution_id`);

--
-- Índices para tabela `tb_invoice_obs`
--
ALTER TABLE `tb_invoice_obs`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`terminal`,`tb_invoice_id`),
  ADD KEY `tb_invoice_id` (`tb_invoice_id`),
  ADD KEY `tb_institution_id` (`tb_institution_id`);

--
-- Índices para tabela `tb_invoice_rectification`
--
ALTER TABLE `tb_invoice_rectification`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`terminal`);

--
-- Índices para tabela `tb_invoice_return_55`
--
ALTER TABLE `tb_invoice_return_55`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`terminal`);

--
-- Índices para tabela `tb_invoice_return_65`
--
ALTER TABLE `tb_invoice_return_65`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`terminal`);

--
-- Índices para tabela `tb_invoice_return_service`
--
ALTER TABLE `tb_invoice_return_service`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`terminal`);

--
-- Índices para tabela `tb_invoice_shipping`
--
ALTER TABLE `tb_invoice_shipping`
  ADD PRIMARY KEY (`id`,`tb_institution_id`),
  ADD KEY `tb_institution_id` (`tb_institution_id`);

--
-- Índices para tabela `tb_iteration`
--
ALTER TABLE `tb_iteration`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_order_id`),
  ADD KEY `tb_situation_id` (`tb_situation_id`);

--
-- Índices para tabela `tb_iteration_attachment`
--
ALTER TABLE `tb_iteration_attachment`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_order_id`,`tb_iteration_id`);

--
-- Índices para tabela `tb_kickback`
--
ALTER TABLE `tb_kickback`
  ADD PRIMARY KEY (`tb_institution_id`,`terminal`,`tb_order_id`,`tb_order_item_id`,`parcel`);

--
-- Índices para tabela `tb_linebusiness`
--
ALTER TABLE `tb_linebusiness`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_log_operation`
--
ALTER TABLE `tb_log_operation`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_user_id`);

--
-- Índices para tabela `tb_mailing`
--
ALTER TABLE `tb_mailing`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `email_2` (`email`);

--
-- Índices para tabela `tb_mailing_group`
--
ALTER TABLE `tb_mailing_group`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_mailing_seq`
--
ALTER TABLE `tb_mailing_seq`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_measure`
--
ALTER TABLE `tb_measure`
  ADD PRIMARY KEY (`id`),
  ADD KEY `updated_at` (`updated_at`);

--
-- Índices para tabela `tb_med_insert_date`
--
ALTER TABLE `tb_med_insert_date`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_med_parts_id`,`tb_order_id`),
  ADD KEY `tb_med_parts_id` (`tb_med_parts_id`);

--
-- Índices para tabela `tb_med_material`
--
ALTER TABLE `tb_med_material`
  ADD PRIMARY KEY (`id`,`tb_institution_id`);

--
-- Índices para tabela `tb_med_parts`
--
ALTER TABLE `tb_med_parts`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_order_id`),
  ADD KEY `tb_med_material_id` (`tb_med_material_id`),
  ADD KEY `tb_med_pos_prog_id` (`tb_med_price_list_id`),
  ADD KEY `tb_order_id` (`tb_order_id`);

--
-- Índices para tabela `tb_med_parts_jr`
--
ALTER TABLE `tb_med_parts_jr`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_order_id`);

--
-- Índices para tabela `tb_med_parts_rt`
--
ALTER TABLE `tb_med_parts_rt`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_order_id`);

--
-- Índices para tabela `tb_med_pos_prog`
--
ALTER TABLE `tb_med_pos_prog`
  ADD PRIMARY KEY (`id`,`tb_institution_id`);

--
-- Índices para tabela `tb_med_price_list_jr`
--
ALTER TABLE `tb_med_price_list_jr`
  ADD PRIMARY KEY (`tb_institution_id`,`id`,`tb_broadcaster_id`);

--
-- Índices para tabela `tb_med_price_list_rt`
--
ALTER TABLE `tb_med_price_list_rt`
  ADD PRIMARY KEY (`tb_institution_id`,`id`,`tb_broadcaster_id`);

--
-- Índices para tabela `tb_merchandise`
--
ALTER TABLE `tb_merchandise`
  ADD PRIMARY KEY (`id`,`tb_institution_id`),
  ADD KEY `tb_brand_id` (`tb_brand_id`),
  ADD KEY `kind` (`kind`),
  ADD KEY `updated_at` (`updated_at`);

--
-- Índices para tabela `tb_merchandise_has_provider`
--
ALTER TABLE `tb_merchandise_has_provider`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_merchandise_id`,`tb_provider_id`);

--
-- Índices para tabela `tb_merchandise_has_self`
--
ALTER TABLE `tb_merchandise_has_self`
  ADD PRIMARY KEY (`tb_master_id`,`tb_detail_id`),
  ADD KEY `tb_detail_id` (`tb_detail_id`);

--
-- Índices para tabela `tb_module`
--
ALTER TABLE `tb_module`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_module_has_interface`
--
ALTER TABLE `tb_module_has_interface`
  ADD PRIMARY KEY (`tb_module_id`,`tb_interface_id`),
  ADD KEY `tb_interfaces_id` (`tb_interface_id`);

--
-- Índices para tabela `tb_msg_return_nfe`
--
ALTER TABLE `tb_msg_return_nfe`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_mva_ncm`
--
ALTER TABLE `tb_mva_ncm`
  ADD PRIMARY KEY (`tb_state_id`,`ncm`);

--
-- Índices para tabela `tb_ncm`
--
ALTER TABLE `tb_ncm`
  ADD PRIMARY KEY (`number`);

--
-- Índices para tabela `tb_nfe_events`
--
ALTER TABLE `tb_nfe_events`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_nfe_events_sent`
--
ALTER TABLE `tb_nfe_events_sent`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`terminal`);

--
-- Índices para tabela `tb_observation`
--
ALTER TABLE `tb_observation`
  ADD PRIMARY KEY (`id`,`tb_institution_id`);

--
-- Índices para tabela `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`terminal`),
  ADD KEY `tb_user_id` (`tb_user_id`),
  ADD KEY `tb_institution_id` (`tb_institution_id`);

--
-- Índices para tabela `tb_order_billing`
--
ALTER TABLE `tb_order_billing`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`terminal`),
  ADD KEY `tb_payment_types_id` (`tb_payment_types_id`);

--
-- Índices para tabela `tb_order_consignment`
--
ALTER TABLE `tb_order_consignment`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`terminal`,`tb_customer_id`);

--
-- Índices para tabela `tb_order_consignment_operation`
--
ALTER TABLE `tb_order_consignment_operation`
  ADD PRIMARY KEY (`tb_order_item_id`,`tb_institution_id`,`terminal`,`tb_order_id`);

--
-- Índices para tabela `tb_order_cost`
--
ALTER TABLE `tb_order_cost`
  ADD PRIMARY KEY (`id`,`tb_order_id`,`tb_order_item_id`,`terminal`),
  ADD KEY `tb_order_item_id` (`tb_order_item_id`),
  ADD KEY `tb_product_id` (`tb_product_id`);

--
-- Índices para tabela `tb_order_has_delivery`
--
ALTER TABLE `tb_order_has_delivery`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_order_id`,`tb_order_item_id`);

--
-- Índices para tabela `tb_order_has_production`
--
ALTER TABLE `tb_order_has_production`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_order_id`,`tb_order_item_id`),
  ADD KEY `tb_order_has_production_ibfk_2` (`tb_order_id`),
  ADD KEY `tb_order_has_production_ibfk_3` (`tb_order_item_id`);

--
-- Índices para tabela `tb_order_has_purchase`
--
ALTER TABLE `tb_order_has_purchase`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_order_id`,`tb_order_item_id`),
  ADD KEY `tb_order_id` (`tb_order_id`),
  ADD KEY `tb_order_item_id` (`tb_order_item_id`);

--
-- Índices para tabela `tb_order_has_reserved`
--
ALTER TABLE `tb_order_has_reserved`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_order_id`,`tb_order_item_id`,`tb_stock_reserved_id`),
  ADD KEY `tb_order_id` (`tb_order_id`),
  ADD KEY `tb_order_item_id` (`tb_order_item_id`),
  ADD KEY `tb_stock_reserved_id` (`tb_stock_reserved_id`);

--
-- Índices para tabela `tb_order_item`
--
ALTER TABLE `tb_order_item`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_order_id`,`terminal`),
  ADD KEY `tb_product_id` (`tb_product_id`),
  ADD KEY `tb_order_id` (`tb_order_id`),
  ADD KEY `tb_institution_id` (`tb_institution_id`),
  ADD KEY `tb_stock_list_id` (`tb_stock_list_id`);

--
-- Índices para tabela `tb_order_item_cofins`
--
ALTER TABLE `tb_order_item_cofins`
  ADD PRIMARY KEY (`tb_order_id`,`tb_order_item_id`,`tb_institution_id`,`terminal`);

--
-- Índices para tabela `tb_order_item_detached`
--
ALTER TABLE `tb_order_item_detached`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_order_id`,`terminal`);

--
-- Índices para tabela `tb_order_item_detail`
--
ALTER TABLE `tb_order_item_detail`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_order_id`,`terminal`);

--
-- Índices para tabela `tb_order_item_detail_observation`
--
ALTER TABLE `tb_order_item_detail_observation`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_order_id`,`terminal`);

--
-- Índices para tabela `tb_order_item_detail_optional`
--
ALTER TABLE `tb_order_item_detail_optional`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_order_id`,`terminal`);

--
-- Índices para tabela `tb_order_item_detail_remove`
--
ALTER TABLE `tb_order_item_detail_remove`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_order_id`,`terminal`);

--
-- Índices para tabela `tb_order_item_flex`
--
ALTER TABLE `tb_order_item_flex`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_order_id`,`terminal`,`tb_salesman_id`);

--
-- Índices para tabela `tb_order_item_icms`
--
ALTER TABLE `tb_order_item_icms`
  ADD PRIMARY KEY (`tb_order_id`,`tb_order_item_id`,`tb_institution_id`,`terminal`);

--
-- Índices para tabela `tb_order_item_ii`
--
ALTER TABLE `tb_order_item_ii`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_order_id`,`terminal`,`tb_order_item_id`);

--
-- Índices para tabela `tb_order_item_ipi`
--
ALTER TABLE `tb_order_item_ipi`
  ADD PRIMARY KEY (`tb_order_id`,`tb_order_item_id`,`tb_institution_id`,`terminal`);

--
-- Índices para tabela `tb_order_item_issqn`
--
ALTER TABLE `tb_order_item_issqn`
  ADD PRIMARY KEY (`tb_order_id`,`tb_order_item_id`,`tb_institution_id`,`terminal`);

--
-- Índices para tabela `tb_order_item_job`
--
ALTER TABLE `tb_order_item_job`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_order_id`,`terminal`);

--
-- Índices para tabela `tb_order_item_pis`
--
ALTER TABLE `tb_order_item_pis`
  ADD PRIMARY KEY (`tb_order_id`,`tb_order_item_id`,`tb_institution_id`,`terminal`);

--
-- Índices para tabela `tb_order_job`
--
ALTER TABLE `tb_order_job`
  ADD PRIMARY KEY (`id`,`tb_institution_id`),
  ADD KEY `tb_customer_id` (`tb_customer_id`),
  ADD KEY `tb_institution_id` (`tb_institution_id`);

--
-- Índices para tabela `tb_order_job_scope`
--
ALTER TABLE `tb_order_job_scope`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_order_id`);

--
-- Índices para tabela `tb_order_packing`
--
ALTER TABLE `tb_order_packing`
  ADD PRIMARY KEY (`id`,`tb_institution_id`),
  ADD KEY `tb_entity_id` (`tb_entity_id`),
  ADD KEY `tb_situation_id` (`tb_situation_id`);

--
-- Índices para tabela `tb_order_pi`
--
ALTER TABLE `tb_order_pi`
  ADD PRIMARY KEY (`id`,`tb_institution_id`),
  ADD KEY `tb_agency_id` (`tb_agency_id`,`tb_advertiser_id`,`tb_broadcaster_id`),
  ADD KEY `tb_broadcaster_id` (`tb_broadcaster_id`),
  ADD KEY `tb_advertiser_id` (`tb_advertiser_id`),
  ADD KEY `nr_internal` (`nr_internal`),
  ADD KEY `nr_original` (`nr_original`),
  ADD KEY `dt_original` (`dt_original`),
  ADD KEY `dt_internal` (`dt_internal`);

--
-- Índices para tabela `tb_order_production`
--
ALTER TABLE `tb_order_production`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`terminal`);

--
-- Índices para tabela `tb_order_production_mp`
--
ALTER TABLE `tb_order_production_mp`
  ADD PRIMARY KEY (`terminal`,`tb_institution_id`,`tb_order_id`,`id`);

--
-- Índices para tabela `tb_order_production_pa`
--
ALTER TABLE `tb_order_production_pa`
  ADD PRIMARY KEY (`terminal`,`tb_institution_id`,`tb_order_id`,`id`);

--
-- Índices para tabela `tb_order_purchase`
--
ALTER TABLE `tb_order_purchase`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`terminal`),
  ADD KEY `tb_provider_id` (`tb_provider_id`),
  ADD KEY `tb_institution_id` (`tb_institution_id`);

--
-- Índices para tabela `tb_order_sale`
--
ALTER TABLE `tb_order_sale`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`terminal`,`tb_salesman_id`),
  ADD KEY `tb_customer_id` (`tb_customer_id`),
  ADD KEY `tb_salesman_id` (`tb_salesman_id`),
  ADD KEY `tb_institution_id` (`tb_institution_id`);

--
-- Índices para tabela `tb_order_shipping`
--
ALTER TABLE `tb_order_shipping`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`terminal`),
  ADD KEY `tb_institution_id` (`tb_institution_id`),
  ADD KEY `tb_carrier_id` (`tb_carrier_id`);

--
-- Índices para tabela `tb_order_stock_adjust`
--
ALTER TABLE `tb_order_stock_adjust`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`terminal`);

--
-- Índices para tabela `tb_order_stock_transfer`
--
ALTER TABLE `tb_order_stock_transfer`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`terminal`);

--
-- Índices para tabela `tb_order_totalizer`
--
ALTER TABLE `tb_order_totalizer`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`terminal`),
  ADD KEY `tb_institution_id` (`tb_institution_id`);

--
-- Índices para tabela `tb_order_to_buy`
--
ALTER TABLE `tb_order_to_buy`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_order_id`,`tb_order_item_id`),
  ADD KEY `tb_order_item_id` (`tb_order_item_id`),
  ADD KEY `tb_order_id` (`tb_order_id`),
  ADD KEY `tb_order_to_buy_ibfk_1` (`tb_institution_id`);

--
-- Índices para tabela `tb_order_to_deliver`
--
ALTER TABLE `tb_order_to_deliver`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_order_id`,`tb_order_item_id`),
  ADD KEY `tb_order_item_id` (`tb_order_item_id`),
  ADD KEY `tb_order_id` (`tb_order_id`);

--
-- Índices para tabela `tb_order_to_production`
--
ALTER TABLE `tb_order_to_production`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_order_id`,`tb_order_item_id`),
  ADD KEY `tb_order_to_production_ibfk_1` (`tb_institution_id`),
  ADD KEY `tb_order_to_production_ibfk_2` (`tb_order_id`),
  ADD KEY `tb_order_to_production_ibfk_3` (`tb_order_item_id`);

--
-- Índices para tabela `tb_package`
--
ALTER TABLE `tb_package`
  ADD PRIMARY KEY (`id`),
  ADD KEY `updated_at` (`updated_at`);

--
-- Índices para tabela `tb_payment_types`
--
ALTER TABLE `tb_payment_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `updated_at` (`updated_at`);

--
-- Índices para tabela `tb_person`
--
ALTER TABLE `tb_person`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices para tabela `tb_phone`
--
ALTER TABLE `tb_phone`
  ADD PRIMARY KEY (`id`,`kind`),
  ADD KEY `id` (`id`,`kind`);

--
-- Índices para tabela `tb_price`
--
ALTER TABLE `tb_price`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_price_list_id`,`tb_product_id`),
  ADD KEY `tb_institution_id` (`tb_institution_id`,`tb_product_id`),
  ADD KEY `updated_at` (`updated_at`);

--
-- Índices para tabela `tb_price_list`
--
ALTER TABLE `tb_price_list`
  ADD PRIMARY KEY (`id`,`tb_institution_id`),
  ADD KEY `updated_at` (`updated_at`);

--
-- Índices para tabela `tb_privilege`
--
ALTER TABLE `tb_privilege`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_product`
--
ALTER TABLE `tb_product`
  ADD PRIMARY KEY (`id`,`tb_institution_id`),
  ADD KEY `tb_category_id` (`tb_category_id`),
  ADD KEY `tb_institution_id` (`tb_institution_id`),
  ADD KEY `tb_product_ibfk_1` (`tb_category_id`,`tb_institution_id`),
  ADD KEY `active` (`active`),
  ADD KEY `description` (`description`);

--
-- Índices para tabela `tb_project`
--
ALTER TABLE `tb_project`
  ADD PRIMARY KEY (`id`,`tb_institution_id`);

--
-- Índices para tabela `tb_proj_log_changes`
--
ALTER TABLE `tb_proj_log_changes`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_project_id`,`id`);

--
-- Índices para tabela `tb_promotion`
--
ALTER TABLE `tb_promotion`
  ADD PRIMARY KEY (`tb_institution_id`,`id`),
  ADD KEY `updated_at` (`updated_at`);

--
-- Índices para tabela `tb_promotion_items`
--
ALTER TABLE `tb_promotion_items`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_promotion_id`,`tb_product_id`);

--
-- Índices para tabela `tb_proposal`
--
ALTER TABLE `tb_proposal`
  ADD PRIMARY KEY (`tb_iteration_id`,`tb_institution_id`,`tb_order_id`);

--
-- Índices para tabela `tb_provider`
--
ALTER TABLE `tb_provider`
  ADD PRIMARY KEY (`id`,`tb_institution_id`),
  ADD KEY `tb_institution_id` (`tb_institution_id`);

--
-- Índices para tabela `tb_provisional_receipt_service`
--
ALTER TABLE `tb_provisional_receipt_service`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`terminal`);

--
-- Índices para tabela `tb_rest_group`
--
ALTER TABLE `tb_rest_group`
  ADD PRIMARY KEY (`id`,`tb_institution_id`);

--
-- Índices para tabela `tb_rest_group_has_attribute`
--
ALTER TABLE `tb_rest_group_has_attribute`
  ADD PRIMARY KEY (`id`,`tb_rest_group_id`,`tb_institution_id`);

--
-- Índices para tabela `tb_rest_group_has_measure`
--
ALTER TABLE `tb_rest_group_has_measure`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_rest_group_id`,`tb_measure_id`);

--
-- Índices para tabela `tb_rest_group_has_observation`
--
ALTER TABLE `tb_rest_group_has_observation`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_rest_group_id`);

--
-- Índices para tabela `tb_rest_group_has_optional`
--
ALTER TABLE `tb_rest_group_has_optional`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_rest_group_id`);

--
-- Índices para tabela `tb_rest_menu`
--
ALTER TABLE `tb_rest_menu`
  ADD PRIMARY KEY (`id`,`tb_institution_id`);

--
-- Índices para tabela `tb_rest_menu_has_button`
--
ALTER TABLE `tb_rest_menu_has_button`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_rest_menu_id`,`tb_button_id`);

--
-- Índices para tabela `tb_rest_menu_has_ingredient`
--
ALTER TABLE `tb_rest_menu_has_ingredient`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_rest_menu_id`,`tb_product_id`);

--
-- Índices para tabela `tb_rest_menu_has_product`
--
ALTER TABLE `tb_rest_menu_has_product`
  ADD PRIMARY KEY (`tb_rest_menu_id`,`tb_product_id`,`tb_institution_id`);

--
-- Índices para tabela `tb_rest_subgroup`
--
ALTER TABLE `tb_rest_subgroup`
  ADD PRIMARY KEY (`id`,`tb_institution_id`);

--
-- Índices para tabela `tb_salesman`
--
ALTER TABLE `tb_salesman`
  ADD PRIMARY KEY (`id`,`tb_institution_id`),
  ADD KEY `tb_institution_id` (`tb_institution_id`);

--
-- Índices para tabela `tb_salesman_has_state`
--
ALTER TABLE `tb_salesman_has_state`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_salesman_id`,`tb_state_id`);

--
-- Índices para tabela `tb_salesman_has_stock`
--
ALTER TABLE `tb_salesman_has_stock`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_salesman_id`,`tb_stock_id`);

--
-- Índices para tabela `tb_shipping`
--
ALTER TABLE `tb_shipping`
  ADD PRIMARY KEY (`id`,`tb_institution_id`),
  ADD KEY `tb_order_id` (`tb_order_id`),
  ADD KEY `tb_haulier_id` (`tb_haulier_id`);

--
-- Índices para tabela `tb_situation`
--
ALTER TABLE `tb_situation`
  ADD PRIMARY KEY (`id`,`tb_institution_id`);

--
-- Índices para tabela `tb_social_media`
--
ALTER TABLE `tb_social_media`
  ADD PRIMARY KEY (`id`,`kind`);

--
-- Índices para tabela `tb_state`
--
ALTER TABLE `tb_state`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_state_to_country` (`tb_country_id`);

--
-- Índices para tabela `tb_stock`
--
ALTER TABLE `tb_stock`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_merchandise_id`),
  ADD KEY `codebar` (`codebar`),
  ADD KEY `updated_at` (`updated_at`);

--
-- Índices para tabela `tb_stock_balance`
--
ALTER TABLE `tb_stock_balance`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_stock_list_id`,`tb_merchandise_id`);

--
-- Índices para tabela `tb_stock_list`
--
ALTER TABLE `tb_stock_list`
  ADD PRIMARY KEY (`id`,`tb_institution_id`),
  ADD KEY `updated_at` (`updated_at`);

--
-- Índices para tabela `tb_stock_reserved`
--
ALTER TABLE `tb_stock_reserved`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_stock_list_id`),
  ADD KEY `tb_stock_list_id` (`tb_stock_list_id`),
  ADD KEY `tb_institution_id` (`tb_institution_id`);

--
-- Índices para tabela `tb_stock_statement`
--
ALTER TABLE `tb_stock_statement`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`terminal`,`tb_order_id`,`tb_order_item_id`,`tb_stock_list_id`);

--
-- Índices para tabela `tb_task`
--
ALTER TABLE `tb_task`
  ADD PRIMARY KEY (`tb_iteration_id`,`tb_institution_id`,`tb_order_id`);

--
-- Índices para tabela `tb_tax_cofins`
--
ALTER TABLE `tb_tax_cofins`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_tax_icms_nr`
--
ALTER TABLE `tb_tax_icms_nr`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_tax_icms_sn`
--
ALTER TABLE `tb_tax_icms_sn`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_tax_ipi`
--
ALTER TABLE `tb_tax_ipi`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_tax_pis`
--
ALTER TABLE `tb_tax_pis`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_tax_ruler`
--
ALTER TABLE `tb_tax_ruler`
  ADD PRIMARY KEY (`id`,`tb_institution_id`,`tb_product_id`),
  ADD KEY `tb_tax_icms_nr_id` (`tb_tax_icms_nr_id`),
  ADD KEY `tb_tax_icms_sn_id` (`tb_tax_icms_sn_id`),
  ADD KEY `tb_deter_base_tax_icms_id` (`tb_deter_base_tax_icms_id`),
  ADD KEY `tb_deter_base_tax_icms_st_id` (`tb_deter_base_tax_icms_st_id`),
  ADD KEY `tb_discharge_icms_id` (`tb_discharge_icms_id`),
  ADD KEY `tb_tax_ipi_id` (`tb_tax_ipi_id`),
  ADD KEY `tb_tax_cofins_id` (`tb_tax_cofins_id`),
  ADD KEY `tb_tax_pis_id` (`tb_tax_pis_id`),
  ADD KEY `tb_cfop_id` (`tb_cfop_id`),
  ADD KEY `tb_state_id` (`tb_state_id`),
  ADD KEY `tb_tax_ruler_ibfk_1` (`tb_institution_id`);

--
-- Índices para tabela `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`,`kind`),
  ADD KEY `updated_at` (`updated_at`);

--
-- Índices para tabela `tb_user_has_privilege`
--
ALTER TABLE `tb_user_has_privilege`
  ADD PRIMARY KEY (`tb_institution_id`,`tb_user_id`,`tb_interface_id`,`tb_privilege_id`);

--
-- Índices para tabela `tb_user_send_email`
--
ALTER TABLE `tb_user_send_email`
  ADD PRIMARY KEY (`tb_user_id`);

--
-- Índices para tabela `tb_work_front`
--
ALTER TABLE `tb_work_front`
  ADD PRIMARY KEY (`id`,`tb_institution_id`);

--
-- Índices para tabela `tutorial`
--
ALTER TABLE `tutorial`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tutorials`
--
ALTER TABLE `tutorials`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_crashlytics`
--
ALTER TABLE `tb_crashlytics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tutorial`
--
ALTER TABLE `tutorial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tutorials`
--
ALTER TABLE `tutorials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tb_address`
--
ALTER TABLE `tb_address`
  ADD CONSTRAINT `fk_city_to_address` FOREIGN KEY (`tb_city_id`) REFERENCES `tb_city` (`id`),
  ADD CONSTRAINT `fk_country_to_address` FOREIGN KEY (`tb_country_id`) REFERENCES `tb_country` (`id`),
  ADD CONSTRAINT `fk_state_to_address` FOREIGN KEY (`tb_state_id`) REFERENCES `tb_state` (`id`);

--
-- Limitadores para a tabela `tb_agency`
--
ALTER TABLE `tb_agency`
  ADD CONSTRAINT `tb_agency_ibfk_1` FOREIGN KEY (`id`) REFERENCES `tb_entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_agency_ibfk_2` FOREIGN KEY (`tb_institution_id`) REFERENCES `tb_institution` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_broadcaster`
--
ALTER TABLE `tb_broadcaster`
  ADD CONSTRAINT `tb_broadcaster_ibfk_1` FOREIGN KEY (`id`) REFERENCES `tb_entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_broadcaster_ibfk_2` FOREIGN KEY (`tb_institution_id`) REFERENCES `tb_institution` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_broadcaster_has_circulation`
--
ALTER TABLE `tb_broadcaster_has_circulation`
  ADD CONSTRAINT `tb_broadcaster_has_circulation_ibfk_1` FOREIGN KEY (`tb_city_id`) REFERENCES `tb_city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_budg_advertise_imp`
--
ALTER TABLE `tb_budg_advertise_imp`
  ADD CONSTRAINT `tb_budg_advertise_imp_ibfk_1` FOREIGN KEY (`tb_broadcaster_id`) REFERENCES `tb_broadcaster` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_budg_advertise_imp_ibfk_2` FOREIGN KEY (`tb_city_id`) REFERENCES `tb_city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_budg_advertise_web`
--
ALTER TABLE `tb_budg_advertise_web`
  ADD CONSTRAINT `tb_budg_advertise_web_ibfk_1` FOREIGN KEY (`tb_broadcaster_id`) REFERENCES `tb_broadcaster` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_budg_advertise_web_ibfk_2` FOREIGN KEY (`tb_city_id`) REFERENCES `tb_city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_category`
--
ALTER TABLE `tb_category`
  ADD CONSTRAINT `tb_category_ibfk_1` FOREIGN KEY (`tb_institution_id`) REFERENCES `tb_institution` (`id`);

--
-- Limitadores para a tabela `tb_city`
--
ALTER TABLE `tb_city`
  ADD CONSTRAINT `fk_city_to_state` FOREIGN KEY (`tb_state_id`) REFERENCES `tb_state` (`id`);

--
-- Limitadores para a tabela `tb_clin_answer`
--
ALTER TABLE `tb_clin_answer`
  ADD CONSTRAINT `tb_clin_answer_ibfk_1` FOREIGN KEY (`tb_clin_quiz_id`) REFERENCES `tb_clin_quiz` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_clin_answer_ibfk_2` FOREIGN KEY (`tb_clin_questionnaire_id`) REFERENCES `tb_clin_questionnaire` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_clin_answer_ibfk_3` FOREIGN KEY (`tb_clin_question_id`) REFERENCES `tb_clin_question` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_clin_question`
--
ALTER TABLE `tb_clin_question`
  ADD CONSTRAINT `tb_clin_question_ibfk_1` FOREIGN KEY (`tb_clin_questionnaire_id`) REFERENCES `tb_clin_questionnaire` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_clin_questionnaire`
--
ALTER TABLE `tb_clin_questionnaire`
  ADD CONSTRAINT `tb_clin_questionnaire_ibfk_1` FOREIGN KEY (`tb_clin_module_id`) REFERENCES `tb_clin_module` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_clin_quiz`
--
ALTER TABLE `tb_clin_quiz`
  ADD CONSTRAINT `tb_clin_quiz_ibfk_1` FOREIGN KEY (`tb_clin_module_id`) REFERENCES `tb_clin_module` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_clin_quiz_ibfk_2` FOREIGN KEY (`tb_clin_questionnaire_id`) REFERENCES `tb_clin_questionnaire` (`id`),
  ADD CONSTRAINT `tb_clin_quiz_ibfk_3` FOREIGN KEY (`tb_clin_professional_id`) REFERENCES `tb_clin_professional` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_clin_quiz_ibfk_4` FOREIGN KEY (`tb_clin_patient_id`) REFERENCES `tb_clin_patient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_institution_has_brand`
--
ALTER TABLE `tb_institution_has_brand`
  ADD CONSTRAINT `tb_institution_has_brand_ibfk_1` FOREIGN KEY (`tb_brand_id`) REFERENCES `tb_brand` (`id`),
  ADD CONSTRAINT `tb_institution_has_brand_ibfk_2` FOREIGN KEY (`tb_institution_id`) REFERENCES `tb_institution` (`id`);

--
-- Limitadores para a tabela `tb_institution_has_color`
--
ALTER TABLE `tb_institution_has_color`
  ADD CONSTRAINT `tb_institution_has_color_ibfk_1` FOREIGN KEY (`tb_color_id`) REFERENCES `tb_color` (`id`);

--
-- Limitadores para a tabela `tb_institution_has_linebusiness`
--
ALTER TABLE `tb_institution_has_linebusiness`
  ADD CONSTRAINT `tb_institution_has_linebusiness_ibfk_1` FOREIGN KEY (`tb_linebusiness_id`) REFERENCES `tb_linebusiness` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_institution_has_linebusiness_ibfk_2` FOREIGN KEY (`tb_institution_id`) REFERENCES `tb_institution` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_institution_has_measure`
--
ALTER TABLE `tb_institution_has_measure`
  ADD CONSTRAINT `tb_institution_has_measure_ibfk_1` FOREIGN KEY (`tb_measure_id`) REFERENCES `tb_measure` (`id`),
  ADD CONSTRAINT `tb_institution_has_measure_ibfk_2` FOREIGN KEY (`tb_institution_id`) REFERENCES `tb_institution` (`id`);

--
-- Limitadores para a tabela `tb_institution_has_module`
--
ALTER TABLE `tb_institution_has_module`
  ADD CONSTRAINT `tb_institution_has_module_ibfk_1` FOREIGN KEY (`tb_modules_id`) REFERENCES `tb_module` (`id`),
  ADD CONSTRAINT `tb_institution_has_module_ibfk_2` FOREIGN KEY (`tb_institution_id`) REFERENCES `tb_institution` (`id`);

--
-- Limitadores para a tabela `tb_institution_has_package`
--
ALTER TABLE `tb_institution_has_package`
  ADD CONSTRAINT `tb_institution_has_package_ibfk_1` FOREIGN KEY (`tb_package_id`) REFERENCES `tb_package` (`id`),
  ADD CONSTRAINT `tb_institution_has_package_ibfk_2` FOREIGN KEY (`tb_institution_id`) REFERENCES `tb_institution` (`id`);

--
-- Limitadores para a tabela `tb_institution_has_payment_types`
--
ALTER TABLE `tb_institution_has_payment_types`
  ADD CONSTRAINT `tb_institution_has_payment_types_ibfk_1` FOREIGN KEY (`tb_institution_id`) REFERENCES `tb_institution` (`id`),
  ADD CONSTRAINT `tb_institution_has_payment_types_ibfk_2` FOREIGN KEY (`tb_payment_types_id`) REFERENCES `tb_payment_types` (`id`);

--
-- Limitadores para a tabela `tb_institution_has_user`
--
ALTER TABLE `tb_institution_has_user`
  ADD CONSTRAINT `tb_institution_has_user_ibfk_1` FOREIGN KEY (`tb_user_id`) REFERENCES `tb_user` (`id`),
  ADD CONSTRAINT `tb_institution_has_user_ibfk_2` FOREIGN KEY (`tb_institution_id`) REFERENCES `tb_institution` (`id`);

--
-- Limitadores para a tabela `tb_interface_has_privilege`
--
ALTER TABLE `tb_interface_has_privilege`
  ADD CONSTRAINT `tb_interface_has_privilege_ibfk_1` FOREIGN KEY (`tb_interface_id`) REFERENCES `tb_interface` (`id`),
  ADD CONSTRAINT `tb_interface_has_privilege_ibfk_2` FOREIGN KEY (`tb_privilege_id`) REFERENCES `tb_privilege` (`id`);

--
-- Limitadores para a tabela `tb_invoice_obs`
--
ALTER TABLE `tb_invoice_obs`
  ADD CONSTRAINT `tb_invoice_obs_ibfk_1` FOREIGN KEY (`tb_invoice_id`) REFERENCES `tb_invoice` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_invoice_obs_ibfk_2` FOREIGN KEY (`tb_institution_id`) REFERENCES `tb_institution` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_merchandise`
--
ALTER TABLE `tb_merchandise`
  ADD CONSTRAINT `tb_merchandise_ibfk_1` FOREIGN KEY (`id`,`tb_institution_id`) REFERENCES `tb_product` (`id`, `tb_institution_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_module_has_interface`
--
ALTER TABLE `tb_module_has_interface`
  ADD CONSTRAINT `tb_module_has_interface_ibfk_1` FOREIGN KEY (`tb_interface_id`) REFERENCES `tb_interface` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_module_has_interface_ibfk_2` FOREIGN KEY (`tb_module_id`) REFERENCES `tb_module` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_order`
--
ALTER TABLE `tb_order`
  ADD CONSTRAINT `tb_order_ibfk_1` FOREIGN KEY (`tb_user_id`) REFERENCES `tb_user` (`id`),
  ADD CONSTRAINT `tb_order_ibfk_2` FOREIGN KEY (`tb_institution_id`) REFERENCES `tb_institution` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_order_has_production`
--
ALTER TABLE `tb_order_has_production`
  ADD CONSTRAINT `tb_order_has_production_ibfk_1` FOREIGN KEY (`tb_institution_id`) REFERENCES `tb_order_to_production` (`tb_institution_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_order_has_production_ibfk_2` FOREIGN KEY (`tb_order_id`) REFERENCES `tb_order_to_production` (`tb_order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_order_has_production_ibfk_3` FOREIGN KEY (`tb_order_item_id`) REFERENCES `tb_order_to_production` (`tb_order_item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_order_pi`
--
ALTER TABLE `tb_order_pi`
  ADD CONSTRAINT `tb_order_pi_ibfk_2` FOREIGN KEY (`tb_agency_id`) REFERENCES `tb_agency` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_order_pi_ibfk_3` FOREIGN KEY (`tb_broadcaster_id`) REFERENCES `tb_broadcaster` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_order_pi_ibfk_4` FOREIGN KEY (`tb_advertiser_id`) REFERENCES `tb_advertiser` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_order_purchase`
--
ALTER TABLE `tb_order_purchase`
  ADD CONSTRAINT `tb_order_purchase_ibfk_1` FOREIGN KEY (`tb_provider_id`) REFERENCES `tb_provider` (`id`);

--
-- Limitadores para a tabela `tb_order_shipping`
--
ALTER TABLE `tb_order_shipping`
  ADD CONSTRAINT `tb_order_shipping_ibfk_3` FOREIGN KEY (`tb_carrier_id`) REFERENCES `tb_carrier` (`id`);

--
-- Limitadores para a tabela `tb_price`
--
ALTER TABLE `tb_price`
  ADD CONSTRAINT `tb_price_ibfk_1` FOREIGN KEY (`tb_institution_id`,`tb_product_id`) REFERENCES `tb_product` (`tb_institution_id`, `id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_product`
--
ALTER TABLE `tb_product`
  ADD CONSTRAINT `tb_product_ibfk_2` FOREIGN KEY (`tb_institution_id`) REFERENCES `tb_institution` (`id`);

--
-- Limitadores para a tabela `tb_salesman`
--
ALTER TABLE `tb_salesman`
  ADD CONSTRAINT `tb_salesman_ibfk_1` FOREIGN KEY (`id`) REFERENCES `tb_entity` (`id`),
  ADD CONSTRAINT `tb_salesman_ibfk_2` FOREIGN KEY (`tb_institution_id`) REFERENCES `tb_institution` (`id`);

--
-- Limitadores para a tabela `tb_shipping`
--
ALTER TABLE `tb_shipping`
  ADD CONSTRAINT `tb_shipping_ibfk_1` FOREIGN KEY (`tb_order_id`) REFERENCES `tb_order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_social_media`
--
ALTER TABLE `tb_social_media`
  ADD CONSTRAINT `fk_social_media_to_entity` FOREIGN KEY (`id`) REFERENCES `tb_entity` (`id`);

--
-- Limitadores para a tabela `tb_state`
--
ALTER TABLE `tb_state`
  ADD CONSTRAINT `fk_state_to_country` FOREIGN KEY (`tb_country_id`) REFERENCES `tb_country` (`id`);

--
-- Limitadores para a tabela `tb_stock_reserved`
--
ALTER TABLE `tb_stock_reserved`
  ADD CONSTRAINT `tb_stock_reserved_ibfk_1` FOREIGN KEY (`tb_stock_list_id`) REFERENCES `tb_stock_list` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_stock_reserved_ibfk_2` FOREIGN KEY (`tb_institution_id`) REFERENCES `tb_institution` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_tax_ruler`
--
ALTER TABLE `tb_tax_ruler`
  ADD CONSTRAINT `tb_tax_ruler_ibfk_1` FOREIGN KEY (`tb_discharge_icms_id`) REFERENCES `tb_discharge_icms` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_tax_ruler_ibfk_10` FOREIGN KEY (`tb_institution_id`) REFERENCES `tb_institution` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_tax_ruler_ibfk_11` FOREIGN KEY (`tb_tax_pis_id`) REFERENCES `tb_tax_pis` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_tax_ruler_ibfk_3` FOREIGN KEY (`tb_tax_icms_sn_id`) REFERENCES `tb_tax_icms_sn` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_tax_ruler_ibfk_4` FOREIGN KEY (`tb_deter_base_tax_icms_st_id`) REFERENCES `tb_deter_base_tax_icms_st` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_tax_ruler_ibfk_5` FOREIGN KEY (`tb_deter_base_tax_icms_id`) REFERENCES `tb_deter_base_tax_icms` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_tax_ruler_ibfk_6` FOREIGN KEY (`tb_cfop_id`) REFERENCES `tb_cfop` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_tax_ruler_ibfk_7` FOREIGN KEY (`tb_state_id`) REFERENCES `tb_state` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_tax_ruler_ibfk_8` FOREIGN KEY (`tb_tax_icms_nr_id`) REFERENCES `tb_tax_icms_nr` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_tax_ruler_ibfk_9` FOREIGN KEY (`tb_tax_ipi_id`) REFERENCES `tb_tax_ipi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `fk_user_to_entity` FOREIGN KEY (`id`) REFERENCES `tb_entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_user_send_email`
--
ALTER TABLE `tb_user_send_email`
  ADD CONSTRAINT `tb_user_send_email_ibfk_1` FOREIGN KEY (`tb_user_id`) REFERENCES `tb_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

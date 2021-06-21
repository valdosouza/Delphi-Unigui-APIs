object MainmForm: TMainmForm
  Left = 0
  Top = 0
  ClientHeight = 527
  ClientWidth = 320
  Caption = ''
  AlignmentControl = uniAlignmentClient
  BorderIcons = []
  DisplayCaption = False
  ShowTitle = False
  CloseButton.DefaultIcon = False
  CloseButton.ShowIcon = False
  TitleButtons = <>
  OnCreate = UnimFormCreate
  OnReady = UnimFormReady
  PixelsPerInch = 96
  TextHeight = 13
  ScrollPosition = 0
  ScrollHeight = 0
  PlatformData = {}
  object htm_Top: TUnimHTMLFrame
    Left = 0
    Top = 0
    Width = 320
    Height = 89
    Hint = ''
    HTML.Strings = (
      '<style>'
      'img{'
      #9'padding :15px;'
      '}'
      '</style>'
      
        '<img src="http://www.merconeti.com.br/images/svg/logo_merconeti.' +
        'svg" '
      'height="83px"'
      '>')
    Align = alTop
  end
  object tab_main: TUnimTabPanel
    AlignWithMargins = True
    Left = 5
    Top = 94
    Width = 310
    Height = 428
    Hint = ''
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ActivePage = tbs_05
    Align = alClient
    object tbs_00: TUnimTabSheet
      Left = 4
      Top = 51
      Width = 302
      Height = 373
      Hint = ''
      Caption = '0'
      LayoutConfig.Height = '100%'
      object htm_message: TUnimHTMLFrame
        Left = 0
        Top = 0
        Width = 302
        Height = 312
        Hint = ''
        HTML.Strings = (
          '<style>'
          '.message {'
          '  height: 50vh;'
          '  border: 1px solid #008ECC;'
          
            '  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(' +
            '0, 0, 0, 0.19);'
          '  margin-top   : 10px;'
          '  margin-bottom: 25px;  '
          '  margin-left  :25px;'
          '  margin-right :25px;'
          '  border: 3px solid blue; '
          '  Text-Align:Center;  '
          '}'
          '</style>'
          '</head>'
          '<body  >'
          '<div class="message">'
          '   %message%'
          '</div>')
        Align = alClient
      end
      object pnl_00_button: TUnimPanel
        AlignWithMargins = True
        Left = 3
        Top = 315
        Width = 296
        Height = 55
        Hint = ''
        Align = alBottom
        LayoutAttribs.Align = 'center'
        LayoutAttribs.Pack = 'end'
        BorderStyle = ubsNone
        object btn_0_next: TUnimButton
          AlignWithMargins = True
          Left = 161
          Top = 3
          Width = 132
          Height = 49
          Hint = ''
          Align = alRight
          Caption = 'Avan'#231'ar'
          UI = 'round'
          LayoutConfig.Cls = 'button'
          OnClick = btn_0_nextClick
        end
        object btn_0_prior: TUnimButton
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 132
          Height = 49
          Hint = ''
          Align = alLeft
          Caption = 'Voltar'
          UI = 'round'
          LayoutConfig.Cls = 'button'
          OnClick = btn_0_priorClick
        end
      end
    end
    object tbs_01: TUnimTabSheet
      Left = 4
      Top = 51
      Width = 302
      Height = 373
      Hint = ''
      Caption = '1'
      LayoutConfig.Height = '100%'
      object pnl_01_body: TUnimPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 296
        Height = 306
        Hint = ''
        Align = alClient
        LayoutAttribs.Align = 'center'
        LayoutAttribs.Pack = 'start'
        BorderStyle = ubsNone
        object UnimHTMLFrame1: TUnimHTMLFrame
          AlignWithMargins = True
          Left = 13
          Top = -3
          Width = 280
          Height = 134
          Hint = ''
          HTML.Strings = (
            '<style>'
            '.welcome {'
            '  text-align: center;'
            '}'
            ''
            '</style>'
            '<div class="welcome">  '
            
              ' <h2 >Bem vindo ao simulador de campanhas on-line e impresso</h2' +
              '>'
            #9#9
            '</div>')
        end
        object UnimImage2: TUnimImage
          Left = 80
          Top = 137
          Width = 132
          Height = 162
          Hint = ''
          Center = True
          Url = 
            'http://www.gestaowebsetes.com.br/institution/02792594000146/logo' +
            '_adi.jpg'
        end
      end
      object pnl_01_button: TUnimPanel
        AlignWithMargins = True
        Left = 3
        Top = 315
        Width = 296
        Height = 55
        Hint = ''
        Align = alBottom
        LayoutAttribs.Align = 'center'
        LayoutAttribs.Pack = 'end'
        BorderStyle = ubsNone
        object btn_1_next: TUnimButton
          AlignWithMargins = True
          Left = 161
          Top = 3
          Width = 132
          Height = 49
          Hint = ''
          Align = alRight
          Caption = 'Avan'#231'ar'
          UI = 'round'
          LayoutConfig.Cls = 'button'
          OnClick = btn_1_nextClick
        end
      end
    end
    object tbs_02: TUnimTabSheet
      Left = 4
      Top = 51
      Width = 302
      Height = 373
      Hint = ''
      Caption = '2'
      object pnl_02_body: TUnimPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 296
        Height = 306
        Hint = ''
        Align = alClient
        LayoutAttribs.Align = 'center'
        LayoutAttribs.Pack = 'start'
        BorderStyle = ubsNone
        object pnl_02_body_message: TUnimPanel
          Left = 3
          Top = 0
          Width = 288
          Height = 142
          Hint = ''
          Layout = 'hbox'
          LayoutAttribs.Align = 'center'
          LayoutAttribs.Pack = 'start'
          BorderStyle = ubsNone
          object UnimLabel1: TUnimLabel
            Left = 16
            Top = 17
            Width = 258
            Height = 67
            Hint = ''
            Alignment = taCenter
            AutoSize = False
            Caption = 'Selecione as op'#231#245'es que deseja '
            ParentFont = False
            Font.Height = -24
            Font.Style = [fsBold]
          end
        end
        object tog_Impresso: TUnimToggle
          Left = 24
          Top = 184
          Width = 245
          Height = 50
          Hint = ''
          FieldLabel = 'An'#250'ncio Impresso'
          FieldLabelAlign = laRight
          FieldLabelWidth = 75
        end
        object tog_online: TUnimToggle
          Left = 24
          Top = 240
          Width = 245
          Height = 50
          Hint = ''
          FieldLabel = 'Campanha Web'
          FieldLabelAlign = laRight
          FieldLabelWidth = 75
        end
      end
      object pnl_02_button: TUnimPanel
        AlignWithMargins = True
        Left = 3
        Top = 315
        Width = 296
        Height = 55
        Hint = ''
        Align = alBottom
        LayoutAttribs.Align = 'center'
        LayoutAttribs.Pack = 'end'
        BorderStyle = ubsNone
        object btn_02_next: TUnimButton
          AlignWithMargins = True
          Left = 161
          Top = 3
          Width = 132
          Height = 49
          Hint = ''
          Align = alRight
          Caption = 'Avan'#231'ar'
          UI = 'round'
          LayoutConfig.Cls = 'button'
          OnClick = btn_02_nextClick
        end
        object btn_02_prior: TUnimButton
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 132
          Height = 49
          Hint = ''
          Align = alLeft
          Caption = 'Voltar'
          UI = 'round'
          LayoutConfig.Cls = 'button'
          OnClick = btn_02_priorClick
        end
      end
    end
    object tbs_03: TUnimTabSheet
      Left = 4
      Top = 51
      Width = 302
      Height = 373
      Hint = ''
      Caption = '3'
      object E_Search_City: TUnimEdit
        Left = 0
        Top = 0
        Width = 302
        Height = 47
        Hint = ''
        Align = alTop
        Text = ''
        CharCase = ecUpperCase
        ParentFont = False
        TabOrder = 1
        OnChange = E_Search_CityChange
      end
      object pnl_tittle_city: TUnimPanel
        Left = 0
        Top = 47
        Width = 302
        Height = 34
        Hint = ''
        Align = alTop
        Title = 'Lista de Cidades'
        TitleVisible = True
      end
      object Dbg_City: TUnimDBGrid
        Left = 0
        Top = 81
        Width = 302
        Height = 237
        Hint = ''
        Align = alClient
        DataSource = ds_city
        ClientEvents.ExtEvents.Strings = (
          
            'painted=function painted(sender, eOpts)'#13#10'{'#13#10'  sender.updateHideH' +
            'eaders(true);'#13#10'}')
        ClientEvents.UniEvents.Strings = (
          
            'afterCreate=function afterCreate(sender)'#13#10'{'#13#10'  sender.getHeaderC' +
            'ontainer().el.setHeight(0);'#13#10'}')
        Options = [dgRowLines]
        WebOptions.Paged = False
        CellEditor = True
        OnAjaxEvent = Dbg_CityAjaxEvent
        OnDrawColumnCell = Dbg_CityDrawColumnCell
        Columns = <
          item
            Title.Caption = 'Lista de Cidades'
            FieldName = 'name'
            Width = 90
          end
          item
            EditorType = ceToggle
            EditorItems.Strings = (
              'True'
              'False')
            AllowHTML = True
            Alignment = taCenter
            Title.Caption = ' '
            FieldName = 'checked'
            Width = 70
            CheckBoxField.Enabled = False
            CheckBoxField.BooleanFieldOnly = False
          end>
      end
      object pnl_cities_button: TUnimPanel
        Left = 0
        Top = 318
        Width = 302
        Height = 55
        Hint = ''
        Align = alBottom
        LayoutAttribs.Align = 'center'
        LayoutAttribs.Pack = 'end'
        BorderStyle = ubsNone
        object btn_3_next: TUnimButton
          AlignWithMargins = True
          Left = 167
          Top = 3
          Width = 132
          Height = 49
          Hint = ''
          Align = alRight
          Caption = 'Avan'#231'ar'
          UI = 'round'
          LayoutConfig.Cls = 'button'
          OnClick = btn_3_nextClick
        end
        object btn_3_prior: TUnimButton
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 132
          Height = 49
          Hint = ''
          Align = alLeft
          Caption = 'Voltar'
          UI = 'round'
          LayoutConfig.Cls = 'button'
          OnClick = btn_3_priorClick
        end
      end
    end
    object tbs_04: TUnimTabSheet
      Left = 4
      Top = 51
      Width = 302
      Height = 373
      Hint = ''
      Caption = '4'
      object pnl_Tittle_Formats_imp: TUnimPanel
        Left = 0
        Top = 0
        Width = 302
        Height = 34
        Hint = ''
        Align = alTop
        Title = 'Escolha um ou mais formatos'
        TitleVisible = True
      end
      object dbg_format_imp: TUnimDBGrid
        Left = 0
        Top = 34
        Width = 302
        Height = 284
        Hint = ''
        Align = alClient
        DataSource = ds_formats_imp
        ClientEvents.ExtEvents.Strings = (
          
            'painted=function painted(sender, eOpts)'#13#10'{'#13#10'   sender.updateHide' +
            'Headers(true);'#13#10'}')
        ClientEvents.UniEvents.Strings = (
          
            'afterCreate=function afterCreate(sender)'#13#10'{'#13#10'  sender.getHeaderC' +
            'ontainer().el.setHeight(0);'#13#10'}')
        Options = [dgTitles, dgRowLines]
        WebOptions.Paged = False
        CellEditor = True
        OnAjaxEvent = dbg_format_impAjaxEvent
        OnDrawColumnCell = dbg_format_impDrawColumnCell
        Columns = <
          item
            Title.Caption = 'Lista de Formatos'
            FieldName = 'description'
            Width = 220
          end
          item
            AllowHTML = True
            Alignment = taCenter
            Title.Caption = ' '
            FieldName = 'checked'
            Width = 70
          end
          item
            AllowHTML = True
            Alignment = taCenter
            Title.Caption = ' '
            FieldName = 'image'
            Width = 70
          end>
      end
      object pnl_format_imp_button: TUnimPanel
        Left = 0
        Top = 318
        Width = 302
        Height = 55
        Hint = ''
        Align = alBottom
        LayoutAttribs.Align = 'center'
        LayoutAttribs.Pack = 'end'
        BorderStyle = ubsNone
        object btn_4_next: TUnimButton
          AlignWithMargins = True
          Left = 167
          Top = 3
          Width = 132
          Height = 49
          Hint = ''
          Align = alRight
          Caption = 'Avan'#231'ar'
          UI = 'round'
          LayoutConfig.Cls = 'button'
          OnClick = btn_4_nextClick
        end
        object btn_4_prior: TUnimButton
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 132
          Height = 49
          Hint = ''
          Align = alLeft
          Caption = 'Voltar'
          UI = 'round'
          LayoutConfig.Cls = 'button'
          OnClick = btn_4_priorClick
        end
      end
    end
    object tbs_05: TUnimTabSheet
      Left = 4
      Top = 51
      Width = 302
      Height = 373
      Hint = ''
      Caption = '5'
      object pnl_Tittle_Formats_chosen_imp: TUnimPanel
        Left = 0
        Top = 0
        Width = 302
        Height = 34
        Hint = ''
        Align = alTop
        BorderStyle = ubsNone
        object pnl_Tittle_Formats_chosen_imp_1: TUnimPanel
          Left = 0
          Top = 0
          Width = 137
          Height = 34
          Hint = ''
          Align = alClient
          Title = 'Formatos Escolhidos'
          TitleVisible = True
        end
        object pnl_Tittle_Formats_chosen_imp_2: TUnimPanel
          Left = 137
          Top = 0
          Width = 165
          Height = 34
          Hint = ''
          Align = alRight
          Title = 'Inser'#231#245'es'
          TitleVisible = True
        end
      end
      object dbg_format_imp_chosen: TUnimDBGrid
        Left = 0
        Top = 34
        Width = 302
        Height = 284
        Hint = ''
        Align = alClient
        DataSource = ds_formats_imp
        ClientEvents.ExtEvents.Strings = (
          
            'painted=function painted(sender, eOpts)'#13#10'{'#13#10' sender.updateHideHe' +
            'aders(true);'#13#10'}')
        ClientEvents.UniEvents.Strings = (
          
            'afterCreate=function afterCreate(sender)'#13#10'{'#13#10'  sender.getHeaderC' +
            'ontainer().el.setHeight(0);'#13#10'}')
        Options = [dgTitles, dgRowLines]
        WebOptions.Paged = False
        CellEditor = True
        OnAjaxEvent = dbg_format_imp_chosenAjaxEvent
        OnDrawColumnCell = dbg_format_imp_chosenDrawColumnCell
        Columns = <
          item
            Title.Caption = 'Formatos Escolhidos'
            FieldName = 'description'
            Width = 90
          end
          item
            EditorType = ceText
            AllowHTML = True
            Title.Caption = ' '
            FieldName = 'btn_insertion'
            Width = 90
          end>
      end
      object pnl_format_imp_chosen_button: TUnimPanel
        Left = 0
        Top = 318
        Width = 302
        Height = 55
        Hint = ''
        Align = alBottom
        LayoutAttribs.Align = 'center'
        LayoutAttribs.Pack = 'end'
        BorderStyle = ubsNone
        object btn_5_next: TUnimButton
          AlignWithMargins = True
          Left = 167
          Top = 3
          Width = 132
          Height = 49
          Hint = ''
          Align = alRight
          Caption = 'Avan'#231'ar'
          UI = 'round'
          LayoutConfig.Cls = 'button'
          OnClick = btn_5_nextClick
        end
        object btn_5_prior: TUnimButton
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 132
          Height = 49
          Hint = ''
          Align = alLeft
          Caption = 'Voltar'
          UI = 'round'
          LayoutConfig.Cls = 'button'
          OnClick = btn_5_priorClick
        end
      end
    end
    object tbs_06: TUnimTabSheet
      Left = 4
      Top = 51
      Width = 302
      Height = 373
      Hint = ''
      Caption = '6'
      object pnl_Tittle_Formats_web: TUnimPanel
        Left = 0
        Top = 0
        Width = 302
        Height = 34
        Hint = ''
        Align = alTop
        Title = 'Escolha um ou mais formatos'
        TitleVisible = True
      end
      object dbg_format_web: TUnimDBGrid
        Left = 0
        Top = 34
        Width = 302
        Height = 284
        Hint = ''
        Align = alClient
        DataSource = ds_formats_web
        ClientEvents.ExtEvents.Strings = (
          
            'painted=function painted(sender, eOpts)'#13#10'{'#13#10'  sender.updateHideH' +
            'eaders(true);'#13#10'}')
        ClientEvents.UniEvents.Strings = (
          
            'afterCreate=function afterCreate(sender)'#13#10'{'#13#10'  sender.getHeaderC' +
            'ontainer().el.setHeight(0);'#13#10'}')
        Options = [dgTitles, dgRowLines]
        WebOptions.Paged = False
        CellEditor = True
        OnAjaxEvent = dbg_format_webAjaxEvent
        OnDrawColumnCell = dbg_format_webDrawColumnCell
        Columns = <
          item
            Title.Caption = 'Lista de Formatos'
            FieldName = 'description'
            Width = 220
          end
          item
            AllowHTML = True
            Alignment = taCenter
            Title.Caption = ' '
            FieldName = 'checked'
            Width = 70
          end
          item
            AllowHTML = True
            Alignment = taCenter
            Title.Caption = ' '
            FieldName = 'image'
            Width = 70
          end>
      end
      object pnl_format_web_button: TUnimPanel
        Left = 0
        Top = 318
        Width = 302
        Height = 55
        Hint = ''
        Align = alBottom
        LayoutAttribs.Align = 'center'
        LayoutAttribs.Pack = 'end'
        BorderStyle = ubsNone
        object btn_6_next: TUnimButton
          AlignWithMargins = True
          Left = 167
          Top = 3
          Width = 132
          Height = 49
          Hint = ''
          Align = alRight
          Caption = 'Avan'#231'ar'
          UI = 'round'
          LayoutConfig.Cls = 'button'
          OnClick = btn_6_nextClick
        end
        object btn_6_prior: TUnimButton
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 132
          Height = 49
          Hint = ''
          Align = alLeft
          Caption = 'Voltar'
          UI = 'round'
          LayoutConfig.Cls = 'button'
          OnClick = btn_6_priorClick
        end
      end
    end
    object tbs_07: TUnimTabSheet
      Left = 4
      Top = 51
      Width = 302
      Height = 373
      Hint = ''
      Caption = '7'
      object pnl_Tittle_Formats_chosen_web: TUnimPanel
        Left = 0
        Top = 0
        Width = 302
        Height = 34
        Hint = ''
        Align = alTop
        BorderStyle = ubsNone
        object pnl_Tittle_Formats_chosen_web_1: TUnimPanel
          Left = 0
          Top = 0
          Width = 137
          Height = 34
          Hint = ''
          Align = alClient
          Title = 'Formatos Escolhidos'
          TitleVisible = True
        end
        object pnl_Tittle_Formats_chosen_web_2: TUnimPanel
          Left = 137
          Top = 0
          Width = 165
          Height = 34
          Hint = ''
          Align = alRight
          Title = 'Qtde/Dias'
          TitleVisible = True
        end
      end
      object dbg_format_web_chosen_day: TUnimDBGrid
        Left = 0
        Top = 34
        Width = 302
        Height = 284
        Hint = ''
        Align = alClient
        DataSource = ds_formats_web
        ClientEvents.ExtEvents.Strings = (
          
            'painted=function painted(sender, eOpts)'#13#10'{'#13#10'  sender.updateHideH' +
            'eaders(true);'#13#10'}')
        ClientEvents.UniEvents.Strings = (
          
            'afterCreate=function afterCreate(sender)'#13#10'{'#13#10'  sender.getHeaderC' +
            'ontainer().el.setHeight(0);'#13#10'}')
        Options = [dgTitles, dgRowLines]
        WebOptions.Paged = False
        CellEditor = True
        OnAjaxEvent = dbg_format_web_chosen_dayAjaxEvent
        OnDrawColumnCell = dbg_format_web_chosen_dayDrawColumnCell
        Columns = <
          item
            Title.Caption = 'Formatos Escolhidos'
            FieldName = 'description'
            Width = 90
          end
          item
            EditorType = ceText
            AllowHTML = True
            Title.Caption = ' '
            FieldName = 'btn_day'
            Width = 90
          end>
      end
      object pnl_format_web_chosen_day_button: TUnimPanel
        Left = 0
        Top = 318
        Width = 302
        Height = 55
        Hint = ''
        Align = alBottom
        LayoutAttribs.Align = 'center'
        LayoutAttribs.Pack = 'end'
        BorderStyle = ubsNone
        object btn_7_next: TUnimButton
          AlignWithMargins = True
          Left = 167
          Top = 3
          Width = 132
          Height = 49
          Hint = ''
          Align = alRight
          Caption = 'Avan'#231'ar'
          UI = 'round'
          LayoutConfig.Cls = 'button'
          OnClick = btn_7_nextClick
        end
        object btn_7_prior: TUnimButton
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 132
          Height = 49
          Hint = ''
          Align = alLeft
          Caption = 'Voltar'
          UI = 'round'
          LayoutConfig.Cls = 'button'
          OnClick = btn_7_priorClick
        end
      end
    end
    object tbs_08: TUnimTabSheet
      Left = 4
      Top = 51
      Width = 302
      Height = 373
      Hint = ''
      Caption = '8'
      object pnl_Tittle_page_views_icone: TUnimPanel
        Left = 0
        Top = 0
        Width = 302
        Height = 32
        Hint = ''
        Align = alTop
        Title = 'Utilize o '#237'cone para informar'
        TitleVisible = True
      end
      object pnl_Tittle_page_views: TUnimPanel
        Left = 0
        Top = 32
        Width = 302
        Height = 34
        Hint = ''
        Align = alTop
        BorderStyle = ubsNone
        object pnl_Tittle_page_views_1: TUnimPanel
          Left = 0
          Top = 0
          Width = 137
          Height = 34
          Hint = ''
          Align = alClient
          Title = 'Formatos Escolhidos'
          TitleVisible = True
        end
        object pnl_Tittle_page_views_2: TUnimPanel
          Left = 137
          Top = 0
          Width = 165
          Height = 34
          Hint = ''
          Align = alRight
          Title = 'Qtde Pageviews'
          TitleVisible = True
        end
      end
      object dbg_format_web_chosen_pvw: TUnimDBGrid
        Left = 0
        Top = 66
        Width = 302
        Height = 252
        Hint = ''
        Align = alClient
        DataSource = ds_formats_web
        ClientEvents.ExtEvents.Strings = (
          
            'painted=function painted(sender, eOpts)'#13#10'{'#13#10'  sender.updateHideH' +
            'eaders(true);'#13#10'}')
        ClientEvents.UniEvents.Strings = (
          
            'afterCreate=function afterCreate(sender)'#13#10'{'#13#10'  sender.getHeaderC' +
            'ontainer().el.setHeight(0);'#13#10'}')
        Options = [dgTitles, dgRowLines]
        WebOptions.Paged = False
        CellEditor = True
        OnAjaxEvent = dbg_format_web_chosen_pvwAjaxEvent
        OnDrawColumnCell = dbg_format_web_chosen_pvwDrawColumnCell
        Columns = <
          item
            Title.Caption = 'Formatos Escolhidos'
            FieldName = 'description'
            Width = 210
          end
          item
            Title.Caption = 'views'
            FieldName = 'page_view'
            Width = 90
          end
          item
            EditorType = ceText
            AllowHTML = True
            Title.Caption = ' '
            FieldName = 'sld_page_view'
            Width = 60
          end>
      end
      object pnl_format_web_chosen_pvw_button: TUnimPanel
        Left = 0
        Top = 318
        Width = 302
        Height = 55
        Hint = ''
        Align = alBottom
        LayoutAttribs.Align = 'center'
        LayoutAttribs.Pack = 'end'
        BorderStyle = ubsNone
        object btn_8_next: TUnimButton
          AlignWithMargins = True
          Left = 167
          Top = 3
          Width = 132
          Height = 49
          Hint = ''
          Align = alRight
          Caption = 'Avan'#231'ar'
          UI = 'round'
          LayoutConfig.Cls = 'button'
          OnClick = btn_8_nextClick
        end
        object btn_8_prior: TUnimButton
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 132
          Height = 49
          Hint = ''
          Align = alLeft
          Caption = 'Voltar'
          UI = 'round'
          LayoutConfig.Cls = 'button'
          OnClick = btn_8_priorClick
        end
      end
    end
    object tbs_09: TUnimTabSheet
      Left = 4
      Top = 51
      Width = 302
      Height = 373
      Hint = ''
      Caption = '9'
      object E_email: TUnimEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 296
        Height = 44
        Hint = ''
        Align = alTop
        Text = ''
        FieldLabel = 'Digite seu e-mail'
        FieldLabelAlign = laTop
        ParentFont = False
        TabOrder = 2
        InputType = 'email'
      end
      object html_final: TUnimHTMLFrame
        Left = 0
        Top = 50
        Width = 302
        Height = 268
        Hint = ''
        HTML.Strings = (
          '<style>'
          '.message {'
          '  height: 50vh;'
          
            '    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgb' +
            'a(0, 0, 0, 0.19);'
          '  margin-top   : 10px;'
          '  margin-bottom: 25px;'
          '  margin-left  :25px;'
          '  margin-right :25px;'
          '  border: 3px solid #b4b4b4;'
          '  border-radius: 10px;'
          '}'
          '.container {'
          '  height: 100px;'
          '  position: relative;'
          '  padding:20px'
          '}'
          '.vertical-center {'
          '  position: absolute;'
          '  top: 50%;'
          '}'
          'input{'
          '  display: block;'
          '}'
          '.left{'
          '  float: left;'
          '}'
          '</style>'
          '<div class="message">'
          '  <div class="container">'
          '      <div class="vertical-center">'
          '      <h2>'
          
            '      Clique em Finalizar para baixar o PDF ou/e se desejar info' +
            'rme seu e-mail para receber o plano'
          '      </h2>'
          #9' <div>'
          ' '#9#9'<label class="left">'
          '            Email'
          
            '            <input id="email" type="email" value="" name="email"' +
            '>'
          '        </label>'
          '     <div>'
          '   </div>'
          '  </div>'
          '</div>'
          '  ));')
        Align = alClient
      end
      object pnl_09_button: TUnimPanel
        Left = 0
        Top = 318
        Width = 302
        Height = 55
        Hint = ''
        Align = alBottom
        LayoutAttribs.Align = 'center'
        LayoutAttribs.Pack = 'end'
        BorderStyle = ubsNone
        object btn_8_final: TUnimButton
          AlignWithMargins = True
          Left = 157
          Top = 3
          Width = 142
          Height = 49
          Hint = ''
          Align = alRight
          Caption = 'Finalizar'
          UI = 'round'
          LayoutConfig.Cls = 'button'
          OnClick = btn_8_finalClick
        end
      end
    end
    object tbs_10: TUnimTabSheet
      Left = 4
      Top = 51
      Width = 302
      Height = 373
      Hint = ''
      Caption = '10'
      object Html_Reset_operation: TUnimHTMLFrame
        Left = 0
        Top = 0
        Width = 302
        Height = 318
        Hint = ''
        HTML.Strings = (
          ' <style>'
          '.message {'
          '  height: 57vh;'
          
            '    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgb' +
            'a(0, 0, 0, 0.19);'
          '  margin-bottom: 23px;'
          '  margin-left  :20px;'
          '  margin-right :20px;'
          '  border: 3px solid #b4b4b4;'
          '  border-radius: 10px;'
          '}'
          '.divTable{'
          #9'display: table;'
          '}'
          '.divTableRow {'
          #9'display: table-row;'
          '}'
          '.divTableCell {'
          #9'display: table-cell;       '
          '    font-size:14px;   '
          '    float:left; '
          '    '
          '    text-align: center;'
          '}'
          '.divTableCell_2 {'
          #9'display: table-cell;       '
          '    font-size:18px;   '
          '    float:left; '
          '    margin-top: 20px;  '
          '    text-align: center;'
          '}'
          '</style>'
          '<div class="message">  '
          '        <div class="divTable">'
          '            <div class="divTableRow">'
          #9#9#9#9'<div class="divTableCell"  >'
          '                    <h2 >'
          
            '                    Caso deseje alterar o seu plano, <br> refa'#231'a' +
            ' o processo.<br> Estamos a sua disposi'#231#227'o nos canais abaixo: </h' +
            '2>'
          '                </div>'
          '            </div>'
          ''
          #9#9#9'<div class="divTableRow">'
          #9#9#9#9'<div class="divTableCell">'
          
            '                    <img src="http://www.gestaowebsetes.com.br/i' +
            'mages/brands/log_whatsApp.jpg" width="60" height="60">'
          '                </div>'
          '                <div class="divTableCell_2" >'
          '                    (41) 9-8405-2344'
          '                </div>'
          '            </div>'
          '            <div class="divTableRow">'
          '                <div class="divTableCell">'
          
            '                    <img src="http://www.gestaowebsetes.com.br/i' +
            'mages/brands/logo_gmail.png" width="55" height="55">'
          '                </div>'
          #9#9#9#9'<div class="divTableCell_2" >'
          #9#9#9#9#9'ricardo@merconeti.com.br'
          #9#9#9#9'</div>'
          #9#9#9'</div>         '#9
          #9#9'</div>'
          '</div>')
        Align = alClient
      end
      object pnl_10_button: TUnimPanel
        Left = 0
        Top = 318
        Width = 302
        Height = 55
        Hint = ''
        Align = alBottom
        LayoutAttribs.Align = 'center'
        LayoutAttribs.Pack = 'end'
        BorderStyle = ubsNone
        object sb_reset: TUnimButton
          AlignWithMargins = True
          Left = 167
          Top = 3
          Width = 132
          Height = 49
          Hint = ''
          Align = alRight
          Caption = 'Reiniciar'
          UI = 'round'
          LayoutConfig.Cls = 'buttonRed'
          OnClick = sb_resetClick
        end
        object Sb_View: TUnimButton
          AlignWithMargins = True
          Left = 29
          Top = 3
          Width = 132
          Height = 49
          Hint = ''
          Align = alRight
          Caption = 'Visualizar'
          UI = 'round'
          LayoutConfig.Cls = 'button'
          OnClick = Sb_ViewClick
        end
      end
    end
    object tbs_11: TUnimTabSheet
      Left = 4
      Top = 51
      Width = 302
      Height = 373
      Hint = ''
      Caption = '11'
      object pdf_doc: TUnimPDFFrame
        Left = 0
        Top = 0
        Width = 302
        Height = 318
        Hint = ''
        PdfURL = 
          'http://www.gestaowebsetes.com.br/institution/02792594000146/11/b' +
          'udAdvertise_5FC81320D9784917A59D25D4D740451A.pdf'
        Align = alClient
        TabOrder = 1
      end
      object pnl_11_button: TUnimPanel
        Left = 0
        Top = 318
        Width = 302
        Height = 55
        Hint = ''
        Align = alBottom
        LayoutAttribs.Align = 'center'
        LayoutAttribs.Pack = 'end'
        BorderStyle = ubsNone
        object Sb_Reset_2: TUnimButton
          AlignWithMargins = True
          Left = 147
          Top = 3
          Width = 152
          Height = 49
          Hint = ''
          Align = alRight
          Caption = 'Reiniciar'
          UI = 'round'
          LayoutConfig.Cls = 'buttonRed'
          OnClick = sb_resetClick
        end
      end
    end
  end
  object ds_city: TDataSource
    DataSet = cds_city
    Left = 16
    Top = 40
  end
  object cds_city: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 24
    object cds_cityid: TIntegerField
      FieldName = 'id'
    end
    object cds_cityname: TStringField
      FieldName = 'name'
      Size = 100
    end
    object cds_citychecked: TStringField
      FieldName = 'checked'
      Size = 1
    end
    object cds_citychbxValue: TStringField
      FieldName = 'chbxValue'
      Size = 1
    end
  end
  object cds_formats_imp: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 88
    Top = 8
    object cds_formats_impid: TIntegerField
      DisplayWidth = 10
      FieldName = 'id'
    end
    object cds_formats_impdescription: TStringField
      DisplayWidth = 28
      FieldName = 'description'
      Size = 100
    end
    object cds_formats_impchecked: TStringField
      FieldName = 'checked'
      Size = 50
    end
    object cds_formats_impchbxValue: TStringField
      FieldName = 'chbxValue'
      Size = 1
    end
    object cds_formats_impimage: TStringField
      FieldName = 'image'
      Size = 1
    end
    object cds_formats_impinsertion: TStringField
      FieldName = 'insertion'
      Size = 1
    end
    object cds_formats_impbtn_insertion: TStringField
      FieldName = 'btn_insertion'
      Size = 1
    end
    object cds_formats_imppath_file: TStringField
      FieldName = 'path_file'
      Size = 255
    end
  end
  object ds_formats_imp: TDataSource
    DataSet = cds_formats_imp
    Left = 80
    Top = 56
  end
  object cds_formats_web: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 168
    Top = 8
    object cds_formats_webid: TIntegerField
      DisplayWidth = 10
      FieldName = 'id'
    end
    object cds_formats_webdescription: TStringField
      DisplayWidth = 28
      FieldName = 'description'
      Size = 100
    end
    object cds_formats_webchecked: TStringField
      FieldName = 'checked'
      Size = 50
    end
    object cds_formats_webchbxValue: TStringField
      FieldName = 'chbxValue'
      Size = 1
    end
    object cds_formats_webimage: TStringField
      FieldName = 'image'
      Size = 1
    end
    object cds_formats_webday: TStringField
      FieldName = 'day'
      Size = 2
    end
    object cds_formats_webbtn_day: TStringField
      FieldName = 'btn_day'
      Size = 1
    end
    object cds_formats_webpage_view: TIntegerField
      FieldName = 'page_view'
      DisplayFormat = '000,000'
    end
    object cds_formats_websld_page_view: TStringField
      FieldName = 'sld_page_view'
      Size = 1
    end
    object cds_formats_webpath_file: TStringField
      FieldName = 'path_file'
      Size = 255
    end
  end
  object ds_formats_web: TDataSource
    DataSet = cds_formats_web
    Left = 168
    Top = 48
  end
  object Id_Mail: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = True
    SetTLS = True
    UseThread = True
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 248
    Top = 8
  end
end

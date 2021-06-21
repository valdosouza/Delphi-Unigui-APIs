inherited SeaSituation: TSeaSituation
  ClientHeight = 484
  ClientWidth = 498
  Caption = 'Pesquisa de Situa'#231#227'o'
  ExplicitWidth = 514
  ExplicitHeight = 543
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 498
    Height = 420
    ExplicitWidth = 498
    ExplicitHeight = 420
    inherited pc_search: TUniPageControl
      Width = 494
      Height = 416
      ExplicitWidth = 494
      ExplicitHeight = 416
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 486
        ExplicitHeight = 388
        inherited pnl_param: TUniPanel
          Width = 486
          Height = 388
          ExplicitWidth = 486
          ExplicitHeight = 388
          object UniLabel1: TUniLabel
            Left = 5
            Top = 46
            Width = 34
            Height = 13
            Hint = ''
            Caption = 'M'#243'dulo'
            TabOrder = 1
          end
          object E_Description: TUniEdit
            Left = 52
            Top = 21
            Width = 434
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 2
          end
          object E_ID_Search: TUniEdit
            Left = 5
            Top = 21
            Width = 53
            Hint = ''
            Text = ''
            TabOrder = 3
          end
          object L_Codigo: TUniLabel
            Left = 5
            Top = 6
            Width = 33
            Height = 14
            Hint = ''
            Caption = 'C'#243'digo'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 4
          end
          object L_NameCompany: TUniLabel
            Left = 60
            Top = 6
            Width = 49
            Height = 14
            Hint = ''
            Caption = 'Descri'#231#227'o'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 5
          end
          object Cb_Modulo: TUniComboBox
            Left = 5
            Top = 59
            Width = 145
            Hint = ''
            Style = csDropDownList
            Text = ''
            Items.Strings = (
              'CONSERTO'
              'ASSISTENCIA T'#201'CNICA'
              'ENTREGA DE PEDIDO'
              'EXTINTORES'
              'CHAMADOS')
            TabOrder = 6
            IconItems = <>
          end
          object chbx_cad_active: TUniCheckBox
            Left = 156
            Top = 64
            Width = 136
            Height = 17
            Hint = ''
            Checked = True
            Caption = 'Cadastro Ativo'
            TabOrder = 7
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 486
        ExplicitHeight = 388
        inherited dbg_Search: TUniDBGrid
          Width = 486
          Height = 388
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 299
            end
            item
              FieldName = 'modulo'
              Title.Caption = 'M'#243'dulo'
              Width = 130
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 420
    Width = 498
    ExplicitTop = 420
    ExplicitWidth = 498
  end
  inherited cds_msg: TClientDataSet
    Left = 296
    Top = 177
  end
  inherited ds_msg: TDataSource
    Left = 344
    Top = 184
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Size = 100
    end
    object cds_searchmodulo: TStringField
      FieldName = 'modulo'
      Origin = 'modulo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 50
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 336
    Top = 88
  end
end

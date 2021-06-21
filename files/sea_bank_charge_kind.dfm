inherited SeaBankChargeKind: TSeaBankChargeKind
  ClientHeight = 337
  ClientWidth = 567
  Caption = 'Busca de Esp'#233'cie de Documentos'
  ExplicitWidth = 583
  ExplicitHeight = 396
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 567
    Height = 273
    ExplicitWidth = 567
    ExplicitHeight = 367
    inherited pc_search: TUniPageControl
      Width = 563
      Height = 269
      ActivePage = tbs_param
      ExplicitWidth = 563
      ExplicitHeight = 363
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 555
        ExplicitHeight = 335
        inherited pnl_param: TUniPanel
          Width = 555
          Height = 210
          ExplicitWidth = 555
          ExplicitHeight = 304
          object pnl_param_row_1: TUniPanel
            Left = 2
            Top = 2
            Width = 551
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 1
            BorderStyle = ubsNone
            Caption = ''
            object E_Id: TUniEdit
              AlignWithMargins = True
              Left = 4
              Top = 4
              Width = 61
              Height = 44
              Hint = ''
              Text = ''
              Align = alLeft
              TabOrder = 1
              FieldLabel = 'C'#243'digo'
              FieldLabelAlign = laTop
            end
            object E_Abbreviation: TUniEdit
              AlignWithMargins = True
              Left = 71
              Top = 4
              Width = 62
              Height = 44
              Hint = ''
              Text = ''
              Align = alLeft
              TabOrder = 2
              FieldLabel = 'Sigla'
              FieldLabelAlign = laTop
            end
            object E_Description: TUniEdit
              AlignWithMargins = True
              Left = 139
              Top = 4
              Width = 408
              Height = 44
              Hint = ''
              Text = ''
              Align = alClient
              TabOrder = 3
              FieldLabel = 'Descri'#231#227'o'
              FieldLabelAlign = laTop
              ExplicitTop = 3
            end
          end
          object pnl_param_row_2: TUniPanel
            Left = 2
            Top = 54
            Width = 551
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 2
            BorderStyle = ubsNone
            Caption = ''
          end
        end
        inherited pnl_config: TUniPanel
          Top = 210
          Width = 555
          ExplicitTop = 304
          ExplicitWidth = 555
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 555
        ExplicitHeight = 335
        inherited dbg_Search: TUniDBGrid
          Width = 555
          Height = 241
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
            end
            item
              FieldName = 'abbreviation'
              Title.Caption = 'Abrevia'#231#227'o'
              Width = 64
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 335
            end
            item
              FieldName = 'bank'
              Title.Caption = 'Banco'
              Width = 100
              ReadOnly = True
            end
            item
              FieldName = 'bank_id'
              Title.Caption = 'bank_id'
              Width = 64
              Visible = False
              ReadOnly = True
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 273
    Width = 567
    ExplicitTop = 367
    ExplicitWidth = 567
  end
  inherited cds_msg: TClientDataSet
    Left = 296
    Top = 193
  end
  inherited ds_msg: TDataSource
    Left = 400
    Top = 168
  end
  inherited cds_search: TClientDataSet
    Active = True
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_searchabbreviation: TStringField
      FieldName = 'abbreviation'
      Origin = 'abbreviation'
      Size = 10
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Size = 100
    end
  end
end

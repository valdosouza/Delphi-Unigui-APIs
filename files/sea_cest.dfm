inherited SeaCest: TSeaCest
  ClientWidth = 675
  Caption = 'SeaCest'
  ExplicitWidth = 691
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 675
    ExplicitTop = 0
    ExplicitWidth = 675
    ExplicitHeight = 346
    inherited pc_search: TUniPageControl
      Width = 671
      ExplicitWidth = 671
      ExplicitHeight = 342
      inherited tbs_param: TUniTabSheet
        ExplicitWidth = 663
        ExplicitHeight = 314
        inherited pnl_param: TUniPanel
          Width = 663
          ExplicitWidth = 663
          ExplicitHeight = 314
          object label1: TUniLabel
            Left = 121
            Top = 11
            Width = 58
            Height = 14
            Hint = ''
            Caption = 'C'#243'digo NCM'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 1
          end
          object E_Codigo_ncm: TUniEdit
            Left = 121
            Top = 26
            Width = 112
            Hint = ''
            Text = ''
            TabOrder = 2
          end
          object label2: TUniLabel
            Left = 236
            Top = 11
            Width = 49
            Height = 14
            Hint = ''
            Caption = 'Descri'#231#227'o'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 3
          end
          object E_Description: TUniEdit
            Left = 236
            Top = 26
            Width = 403
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 4
          end
          object UniLabel1: TUniLabel
            Left = 6
            Top = 11
            Width = 58
            Height = 14
            Hint = ''
            Caption = 'C'#243'digo NCM'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 5
          end
          object E_codigo_cest: TUniEdit
            Left = 6
            Top = 26
            Width = 112
            Hint = ''
            Text = ''
            TabOrder = 6
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitWidth = 663
        ExplicitHeight = 314
        inherited dbg_Search: TUniDBGrid
          Width = 663
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 675
    ExplicitWidth = 675
  end
  inherited ds_search: TDataSource
    Top = 254
  end
  inherited cds_search: TClientDataSet
    object cds_searchcest: TStringField
      FieldName = 'cest'
      Origin = 'cest'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 7
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Size = 200
    end
    object cds_searchncm: TStringField
      FieldName = 'ncm'
      Origin = 'ncm'
      Size = 8
    end
  end
end

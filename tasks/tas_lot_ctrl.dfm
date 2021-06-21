inherited TasLotCtrl: TTasLotCtrl
  ClientWidth = 730
  Caption = 'Controle de Lote'
  ExplicitWidth = 746
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 730
    ExplicitWidth = 730
    inherited pc_search: TUniPageControl
      Width = 726
      ActivePage = UniTabSheet2
      ExplicitWidth = 726
      inherited tbs_param: TUniTabSheet
        ExplicitWidth = 718
        inherited pnl_param: TUniPanel
          Width = 718
          ExplicitWidth = 718
          object UniGroupBox1: TUniGroupBox
            Left = 3
            Top = 4
            Width = 718
            Height = 69
            Hint = ''
            Caption = 'Digite sua op'#231#227'o de busca'
            TabOrder = 1
            object UniEdit1: TUniEdit
              Left = 2
              Top = 32
              Width = 100
              Hint = ''
              Text = ''
              TabOrder = 1
            end
            object UniLabel1: TUniLabel
              Left = 2
              Top = 17
              Width = 76
              Height = 13
              Hint = ''
              Caption = 'N'#250'mero de Lote'
              TabOrder = 2
            end
            object UniLabel2: TUniLabel
              Left = 106
              Top = 17
              Width = 64
              Height = 13
              Hint = ''
              Caption = 'C'#243'd.Empresa'
              TabOrder = 3
            end
            object UniEdit2: TUniEdit
              Left = 106
              Top = 32
              Width = 77
              Hint = ''
              Text = ''
              TabOrder = 4
            end
            object Ctn_Entity: TUniContainerPanel
              Left = 186
              Top = 19
              Width = 295
              Height = 38
              Hint = ''
              ParentColor = False
              TabOrder = 5
            end
            object UniCheckBox1: TUniCheckBox
              Left = 487
              Top = 39
              Width = 226
              Height = 17
              Hint = ''
              Caption = 'Mostrar somente lotes com saldo positivo'
              TabOrder = 6
            end
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitWidth = 718
        inherited dbg_Search: TUniDBGrid
          Width = 718
        end
      end
      object UniTabSheet2: TUniTabSheet
        Hint = ''
        Caption = 'Movimento do Lote'
        object UniDBGrid1: TUniDBGrid
          Left = 0
          Top = 0
          Width = 718
          Height = 303
          Hint = ''
          DataSource = ds_search
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgTitleClick]
          WebOptions.FetchAll = True
          LoadMask.Message = 'Carregando os dados'
          Align = alClient
          TabOrder = 0
          OnTitleClick = dbg_SearchTitleClick
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 730
    ExplicitWidth = 730
  end
end

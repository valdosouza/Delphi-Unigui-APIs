inherited TasSendEmailMarketing: TTasSendEmailMarketing
  Caption = 'Mala Direta para envio de e-mails'
  ExplicitWidth = 594
  ExplicitHeight = 409
  PixelsPerInch = 96
  TextHeight = 13
  object UniPanel2: TUniPanel
    Left = 0
    Top = 0
    Width = 578
    Height = 370
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitHeight = 304
    object UniPageControl1: TUniPageControl
      Left = 1
      Top = 1
      Width = 576
      Height = 369
      Hint = ''
      ActivePage = UniTabSheet1
      TabOrder = 1
      object UniTabSheet1: TUniTabSheet
        Hint = ''
        Caption = 'Lista de Endere'#231'os de e-mail'
        ExplicitHeight = 269
        object UniPanel3: TUniPanel
          Left = 0
          Top = 0
          Width = 568
          Height = 49
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object UniSpinEdit1: TUniSpinEdit
            Left = 3
            Top = 19
            Width = 71
            Height = 22
            Hint = ''
            TabOrder = 1
          end
          object UniLabel1: TUniLabel
            Left = 3
            Top = 4
            Width = 71
            Height = 13
            Hint = ''
            Caption = 'Pausa envio(s)'
            TabOrder = 2
          end
        end
        object UniDBGrid1: TUniDBGrid
          Left = 0
          Top = 49
          Width = 568
          Height = 185
          Hint = ''
          LoadMask.Message = 'Loading data...'
          TabOrder = 1
        end
        object UniPanel4: TUniPanel
          Left = 0
          Top = 235
          Width = 568
          Height = 37
          Hint = ''
          TabOrder = 2
          BorderStyle = ubsFrameLowered
          Caption = ''
          object UniButton1: TUniButton
            Left = 2
            Top = 5
            Width = 89
            Height = 25
            Hint = ''
            Caption = 'Marcar todos'
            TabOrder = 1
          end
          object UniButton2: TUniButton
            Left = 92
            Top = 5
            Width = 89
            Height = 25
            Hint = ''
            Caption = ' Desmarcar todos'
            TabOrder = 2
          end
        end
        object UniPanel1: TUniPanel
          Left = 0
          Top = 275
          Width = 568
          Height = 66
          Hint = ''
          Align = alBottom
          Anchors = [akLeft, akRight, akBottom]
          TabOrder = 3
          BorderStyle = ubsFrameLowered
          Caption = ''
          ExplicitLeft = 1
          ExplicitTop = 274
          object UniButton3: TUniButton
            Left = 95
            Top = 3
            Width = 91
            Height = 60
            Hint = ''
            Caption = 'Email - '#218'nico'
            TabOrder = 1
          end
          object UniButton4: TUniButton
            Left = 3
            Top = 3
            Width = 91
            Height = 60
            Hint = ''
            Caption = 'Email - Lote'
            TabOrder = 2
          end
          object Sb_Search: TUniSpeedButton
            Left = 188
            Top = 3
            Width = 92
            Height = 60
            Hint = ''
            Caption = 'Buscar - F7'
            ParentColor = False
            Color = clWindow
            IconAlign = iaTop
          end
          object Sb_Close: TUniSpeedButton
            Left = 281
            Top = 3
            Width = 92
            Height = 60
            Hint = ''
            Caption = 'Fechar - ESC'
            ParentColor = False
            Color = clWindow
            IconAlign = iaTop
          end
        end
      end
      object UniTabSheet2: TUniTabSheet
        Hint = ''
        Caption = 'Mensagem'
        ExplicitHeight = 269
        object UniPanel5: TUniPanel
          Left = 0
          Top = 0
          Width = 568
          Height = 341
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          ExplicitHeight = 269
          object UniPanel6: TUniPanel
            Left = 2
            Top = 2
            Width = 564
            Height = 63
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            BorderStyle = ubsFrameLowered
            Caption = ''
            object UniLabel2: TUniLabel
              Left = 3
              Top = 4
              Width = 39
              Height = 13
              Hint = ''
              Caption = 'Assunto'
              TabOrder = 1
            end
            object UniEdit1: TUniEdit
              Left = 3
              Top = 19
              Width = 698
              Hint = ''
              Text = ''
              TabOrder = 2
            end
            object UniLabel3: TUniLabel
              Left = 3
              Top = 44
              Width = 51
              Height = 13
              Hint = ''
              Caption = 'Mensagem'
              TabOrder = 3
            end
          end
          object UniHTMLMemo1: TUniHTMLMemo
            Left = 2
            Top = 65
            Width = 564
            Height = 274
            Hint = ''
            Lines.Strings = (
              'UniHTMLMemo1')
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            Color = clWindow
            TabOrder = 2
            ExplicitHeight = 202
          end
        end
      end
    end
  end
end

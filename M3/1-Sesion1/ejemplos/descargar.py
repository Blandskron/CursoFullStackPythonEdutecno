from pytube import YouTube
from pytube.exceptions import RegexMatchError

def download_video(url, output_path='.'):
    try:
        # Crear objeto YouTube
        yt = YouTube(url)

        # Seleccionar la mejor calidad disponible
        video = yt.streams.get_highest_resolution()

        # Descargar el video
        print(f'Descargando: {yt.title}')
        video.download(output_path)
        print('Descarga exitosa!')
    except RegexMatchError:
        print("Error al procesar la URL del video. Asegúrate de que sea válida.")
    except Exception as e:
        print(f'Ocurrió un error durante la descarga: {e}')

if __name__ == '__main__':
    # URL del video de YouTube
    video_url = 'youtube.com/watch?v=kLf3drTRhks'  # Reemplaza con la URL del video que quieras descargar

    # Directorio donde se guardará el video descargado
    output_directory = './descargas'

    # Llamar a la función para descargar el video
    download_video(video_url, output_directory)

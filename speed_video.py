import argparse
from moviepy.editor import VideoFileClip, vfx

def speed_up_video(input_path, output_path, speed_factor):
    # Load the video file
    video = VideoFileClip(input_path)
    
    # Speed up the video
    sped_up_video = video.fx(vfx.speedx, speed_factor)
    
    # Write the result to the output file
    sped_up_video.write_videofile(output_path, codec="libx264")
    
    print(f"Video saved to {output_path}")

if __name__ == "__main__":
    # Set up argument parsing
    parser = argparse.ArgumentParser(description="Speed up a video file.")
    
    # Add arguments
    parser.add_argument("input", help="Path to the input .mp4 file")
    parser.add_argument("speed", type=float, help="Speed factor (e.g., 2.0 for double speed)")
    parser.add_argument("output", nargs="?", default="output_spedup.mp4", help="Path to save the sped-up video (optional, default is 'output_spedup.mp4')")
    
    # Parse the arguments
    args = parser.parse_args()
    
    # Run the function with the parsed arguments
    speed_up_video(args.input, args.output, args.speed)

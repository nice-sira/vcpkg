#pragma once

#include <vcpkg/vcpkgpaths.h>

namespace vcpkg::Export
{
    extern const CommandStructure COMMAND_STRUCTURE;

    void perform_and_exit(const VcpkgCmdArguments& args, const VcpkgPaths& paths, const Triplet& default_triplet);

    void export_integration_files(const fs::path& raw_exported_dir_path, const VcpkgPaths& paths, std::string const& export_id);
    void export_integration_files_nuget_graph(const fs::path& raw_exported_dir_path,
                                              const VcpkgPaths& paths,
                                              std::string const& export_id);
}
